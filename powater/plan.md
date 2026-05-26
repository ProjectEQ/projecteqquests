# PoWater Open World / DZ Quest Separation

Reference implementation for separating static-zone and instanced (DZ) event state. Use this document when applying the same pattern to other zones.

**Status:** Implemented and verified working (Coirnav event).

---

## Problem (what went wrong)

A single quest script ran in both open world and DZ. Partial fixes (skip `coirnav_done` in instances) were not enough:

- **Unscoped zone globals** (`coirnav_wave`) — DZ and OW shared one key; triggering one bucket affected the other.
- **Open-world lockout leak** — fake Coirnav `delglobal("coirnav_done")` ran in DZ and cleared OW lockouts.
- **NPC timers only** — fail timer lost on zone idle; wave state could desync after reload.

---

## Reusable approach (checklist for new quests)

### 1. Separate three kinds of state

| Kind | Open world | DZ / instance | API |
|------|------------|---------------|-----|
| Zone event progress (wave, doors, phase) | Scoped key, `instance_id == 0` | Scoped key with `instance_id` | `set_data` + optional scoped qglobal |
| Zone event timers (fail clock) | Store **unix deadline** in data bucket | Same, per instance | `set_data` + `settimer`; rehydrate on controller `EVENT_SPAWN` |
| Replay / attempt lockout | Zone qglobal on static zone | Expedition lockout | `setglobal` vs `get_expedition()->AddLockout` |
| Character progression (flags, keys) | Unchanged | Unchanged | Per-character qglobal / flag — **do not** instance-scope |

**Rule:** Never use a bare `quest::setglobal("event_foo")` for anything that can run in both static and instanced copies of the same zone.

### 2. Key naming conventions

**Qglobals (Perl / Lua):**

- Open world: `event_wave`, `event_done`
- Instance: `{instance_id}_event_wave` (ikkinz style: `$instanceid.marakill`)

**Data buckets (preferred for durable zone state):**

- Open world: `{zoneshort}-ow-{suffix}` — e.g. `powater-ow-coirnav_wave`
- Instance: `{zoneshort}-{instance_id}-{suffix}` — e.g. `powater-4821-coirnav_fail_at`

**Lua module:** `require("quest_scope")` in [`lua_modules/quest_scope.lua`](../lua_modules/quest_scope.lua)

```lua
local scope = require("quest_scope")

scope.instance_id()                    -- 0 = open world
scope.is_instance()
scope.global_key("event_wave")         -- qglobal key string
scope.data_key("event_wave")           -- data bucket key string
scope.set_data("event_wave", "3", "M32")
scope.get_data("event_wave")
scope.set_fail_deadline("coirnav", 1895, "M32")  -- stores os.time() + duration
scope.remaining_seconds("coirnav")     -- for spawn rehydration
scope.clear_event("coirnav")           -- wave + fail_at + scoped global
```

**Perl (no require):** Copy helpers from `#coirnav_controller.pl`:

- `ScopeInstanceId()` — `$instanceid` or `quest::GetInstanceID("zoneshort", version)`
- `IsInstancePoWater()` — `ScopeInstanceId() > 0`
- `EventGlobalKey($base)` / `EventDataKey($suffix)`
- `GetCoirnavWave` / `SetCoirnavWave` — data bucket as source of truth
- `SetFailDeadline` / `RehydrateEventTimers` / `ClearCoirnavEventState`

### 3. Persistence — what survives what

| Mechanism | OW/DZ separation | Zone idle | Server restart | Use for |
|-----------|------------------|-----------|----------------|---------|
| Scoped **qglobal** | Yes | Sometimes | Often (until TTL) | Legacy compat, quick reads |
| **set_data** / **get_data** | Yes (key includes instance) | **Yes** | **Yes** | Wave, phase, fail deadline |
| **settimer** on NPC | N/A | **No** | **No** | Runtime only — rehydrate from bucket on spawn |
| **SetBucket** (client) | Per character | Yes | Yes | Personal loot gates |
| **AddLockout** (expedition) | DZ only | Yes | Yes | DZ replay timer (e.g. 9h) |

**Timer pattern (hybrid):**

```perl
# On event start
my $fail_at = time() + $duration;
quest::set_data(EventDataKey("event_fail_at"), $fail_at, "M32");
quest::settimer(1, $duration);

# On controller EVENT_SPAWN (zone wake / repop)
sub EVENT_SPAWN {
  quest::stopalltimers();
  my $fail_at = quest::get_data(EventDataKey("event_fail_at"));
  if (defined $fail_at && $fail_at ne "") {
    my $remaining = int($fail_at) - time();
    if ($remaining > 0) {
      quest::settimer(1, $remaining);
    } else {
      TriggerEventFail();  # deadline passed while zone was down
    }
  }
}
```

Precedent in repo: Inktuta `inktuta_status-{instance_id}` ([`inktuta/zone_status.lua`](../inktuta/zone_status.lua)), Uqua `instance_id .. "_suffix"` ([`uqua/player.lua`](../uqua/player.lua)).

### 4. Lockouts — two channels

| Channel | When | Example (Coirnav) |
|---------|------|-------------------|
| **Open world** | `!IsInstance()` only | `coirnav_done` — H4 win, H2 fail |
| **DZ** | `IsInstance()` only | `AddLockout("Reef of Coirnav", 32400)` — 9 hours |

Do not set OW zone lockouts from DZ scripts. Do not `delglobal` OW lockouts from instance-only spawns (fake Coirnav fix).

Register DZ lockout label in [`lua_modules/lockouts_def.lua`](../lua_modules/lockouts_def.lua) if Agent of Change / `InstanceRequests` displays it.

### 5. Fresh DZ instance

- New instance ID → empty `${id}_*` globals and `zone-{id}-*` data keys automatically.
- Controller `EVENT_SPAWN`: stop timers, rehydrate only if **this** instance has active `event_fail_at`.
- Confirm server/spawn config spawns instance-version NPCs into the new instance (not shared with static zone).

### 6. Scripts that only signal the controller

Wave trash NPCs (`a_*fiend.pl`) only `signalwith` the controller — **no changes** needed if they do not read/write globals directly.

### 7. Migration steps for another zone

1. List all `setglobal` / `$qglobals{...}` used by the event.
2. Classify each: event state (scope it), character flag (leave alone), lockout (split OW vs DZ).
3. Add `ScopeInstanceId` + key helpers to the zone controller (or convert to Lua + `quest_scope`).
4. Move wave/phase/fail deadline to `set_data` with scoped keys.
5. Add `EVENT_SPAWN` rehydration for any fail/event timers.
6. Guard OW-only logic with `if (!IsInstance())`.
7. Add DZ `AddLockout` on event end if applicable.
8. Test OW, two parallel DZs, idle mid-event, and restart mid-event.

---

## Coirnav implementation (this zone)

### Files changed

| File | Role |
|------|------|
| [`lua_modules/quest_scope.lua`](../lua_modules/quest_scope.lua) | Shared Lua API for other zones |
| [`#coirnav_controller.pl`](%23coirnav_controller.pl) | Event brain: scoped state, buckets, rehydration, DZ lockout |
| [`Coirnav_the_Avatar_of_Water.pl`](Coirnav_the_Avatar_of_Water.pl) | OW-only `coirnav_done` clear on spawn |
| [`#Guardian_of_Coirnav.pl`](%23Guardian_of_Coirnav.pl) | Entry; OW lockout depop only |
| [`lua_modules/lockouts_def.lua`](../lua_modules/lockouts_def.lua) | `{ "Reef of Coirnav", "Reef of Coirnav (DZ)" }` |

### Event flow (player reference)

| Phase | Advance condition |
|-------|-------------------|
| Start | Kill `#Guardian_of_Coirnav` |
| Wave 1 → 2 | **580 s** timer (not kill-based) |
| Wave 2 → 3 | **800 s** timer from event start |
| Wave 3 → 4 (weak nameds) | Kill **all** trash from waves 1–3 (vapor/ice/water fiends); tough nameds depop via script |
| Wave 4 → 5 | Kill all **three weak** nameds |
| Win | Kill real `#Coirnav_the_Avatar_of_Water` |
| Fail | **1895 s** overall event timer (~31.6 min) |

### Constants (controller)

- `$FAIL_SECONDS = 1895`
- `$DZ_LOCKOUT_SEC = 32400` (9 hours)
- `$DZ_LOCKOUT_NAME = "Reef of Coirnav"`
- Data TTL: `M32`

---

## Testing

- **OW:** Guardian → waves; success/fail → `coirnav_done`; fake Coirnav clears lockout only in OW.
- **DZ A / B:** Parallel instances do not share wave state; 9h expedition lockout on end; no `coirnav_done`.
- **Idle / restart:** Mid-event zone unload → re-enter; fail timer resumes from `coirnav_fail_at` or fail fires if expired.

---

## Outside this repo

Confirm DZ creation spawns powater instance versions 1/2 (including `#coirnav_controller` NPC 216107) into a **new** instance entity list, not the static zone.
