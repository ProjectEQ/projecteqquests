How Plane of Time progression works (context)

Phase advancement is driven entirely by expedition lockouts, checked in server/quests/potimeb/zone_status.lua event_spawn. To boot directly into Phase 4, the expedition only needs three lockouts: Phase 1 Complete, Phase 2 Complete, Phase 3 Complete. The GM tool already proves this exact path in server/quests/potimeb/player.lua (tb_p4 -> SetLockouts(1/2/3)).

The two final Phase 3 bosses are spawned in ControlPhaseThree() (the Phase3.9 step):

		eq.spawn2(223073,0,0,1492,1110,374.1,391); -- Avatar_of_the_Elements
		eq.spawn2(223074,0,0,1563,1110,374.1,391); -- Supernatural_Guardian

The expedition (DZ) is created in potimea when players click the clock/portal door (server/quests/potimea/player.lua event_click_door -> CreateExpedition). Players then zone into potimeb and land at one of the five Phase 1 areas. The original Phase 1 port-in coordinates (the destinations the new guides will reuse) come from that same door logic:

			if (door_id == 8) then
				-- GetDoorID =  8 : Air Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -36, 1352, 496, 124);
			elseif (door_id == 9) then
				-- GetDoorID =  9 : Water Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -51, 857, 496, 124);
			elseif (door_id == 10) then
				-- GetDoorID = 10 : Earth Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -35, 1636, 496, 124);
			elseif (door_id == 11) then
				-- GetDoorID = 11 : Fire Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -55, 569, 496, 124);
			elseif (door_id == 12) then
				-- GetDoorID = 12 : Undead Trial
				e.self:MovePCInstance(223, tonumber(instance_id), -27, 1103, 496, 124);
			end

The Phase 4 entrance is (-395, 0, 350, 127) (from the same file's Phase 4 routing and raidMove port locs). The GM tool in server/quests/potimeb/player.lua proves the jump path: tb_p4 does SetLockouts(1/2/3) then ZoneReset (depop zone + repop zone_status 157394 / zone_emoter 157395), which reboots zone_status event_spawn into Phase 4.

Implementation

flowchart TD
    A["Clock in potimea creates DZ; raid zones into potimeb Phase 1 area"] --> B["Druzzil Ro guide at each Phase 1 area"]
    B --> C["Say Earth/Air/Undead/Fire/Water -> teleport between Phase 1 areas"]
    B --> D["Hand in Sands token (looted from a prior Phase 3 clear)"]
    D --> E["Guide sets Phase 1/2/3 Complete lockouts + consumes token"]
    E --> F["Guide ports whole expedition to Phase 4 entrance (-395,0,350)"]
    F --> G["Guide repops zone (like tb_p4) -> zone_status boots Phase 4 gods"]

1. Create the custom token item (DB peq.items)





Access DB via make mc (MySQL console into the mariadb container).



Pick a free id (SELECT MAX(id)+1 FROM items;) and clone a simple quest item for valid column defaults. Keep it fully tradeable between players (not Lore, not No Drop, not No Rent):

INSERT INTO items (Name, lore, loregroup, nodrop, norent, stackable, races, classes, slots, itemtype)
SELECT 'Sands of the Fractured Hourglass', '', 0, 0, 0, 0, 65535, 65535, 0, 0
FROM items WHERE id = <existing_template_item_id>;
SELECT LAST_INSERT_ID(); -- record this as <TOKEN_ID>

(nodrop=0 and norent=0 keep it tradeable and persistent; loregroup=0/empty lore keep it non-Lore.)





Note the resulting <TOKEN_ID> for the steps below.

2. Guaranteed token drop on both bosses

Add an event_spawn that puts the token on the NPC so it lands on the corpse (same pattern as wallofslaughter/default.lua and tipt/zone_status.lua).





server/quests/potimeb/Avatar_of_the_Elements.lua:

function event_spawn(e)
	e.self:AddItem(<TOKEN_ID>, 1);
end





server/quests/potimeb/Supernatural_Guardian.lua: identical event_spawn.

(Both keep their existing event_death_complete.) Since both bosses must die to finish Phase 3, the raid is guaranteed at least one token. The token is tradeable, so guilds can pass/stockpile them freely.

3. Create the Druzzil Ro guide NPC type (DB peq.npc_types)

The existing potimeb Druzzil Ro is NPC 223213 and runs a one-shot end-game cutscene (server/quests/potimeb/Druzzil_Ro.lua), so it cannot be reused directly. Create a new npc type cloned from 223213 (same Druzzil Ro appearance) with a free id - this plan uses 223300 (verify with SELECT id FROM npc_types WHERE id = 223300;).

INSERT INTO npc_types (id, name, lastname, level, race, class, bodytype, gender, texture, size, runspeed, npc_faction_id)
SELECT 223300, 'Druzzil_Ro', 'Guide of the Ages', level, race, class, bodytype, gender, texture, size, 0, npc_faction_id
FROM npc_types WHERE id = 223213;





Display name stays "Druzzil Ro". Behaviour is attached via an id-based script file 223300.lua (id-keyed scripts take precedence over the name-keyed Druzzil_Ro.lua, so the cutscene script is not triggered - verify on this build).



Make sure it is non-aggressive/friendly (cloning 223213 should already be passive). No spawn2/spawngroup DB rows are needed because the guides are spawned from Lua via eq.spawn2.

4. Spawn the guides at the Phase 1 areas (zone_status.lua)

In server/quests/potimeb/zone_status.lua event_spawn, the Phase 1 branch already spawns the five trial triggers:

		eq.spawn2(223169,0,0,13.5,1632.4,492.3,0); -- earth trigger
		eq.spawn2(223170,0,0,10.1,1350,492.6,0); -- air trigger
		eq.spawn2(223171,0,0,18.0,1107,492.2,0); -- undead trigger
		eq.spawn2(223172,0,0,11.5,857,492.5,0); -- water trigger
		eq.spawn2(223173,0,0,13.2,574.2,492.3,0); -- fire trigger

Add a guide at each area's player-arrival spot (the door port-in coords) right after, so a Druzzil Ro is standing where players land:

		eq.spawn2(223300,0,0,-35,1636,496,124); -- Earth area guide
		eq.spawn2(223300,0,0,-36,1352,496,124); -- Air area guide
		eq.spawn2(223300,0,0,-27,1103,496,124); -- Undead area guide
		eq.spawn2(223300,0,0,-51,857,496,124);  -- Water area guide
		eq.spawn2(223300,0,0,-55,569,496,124);  -- Fire area guide

Depop the guides once Phase 1 is cleared so they don't linger into later phases - add eq.depop_all(223300); in the event_signal Phase 1 completion block (the event_counter >= 5 path, around line 220, before spawning the Phase 2 controller).

5. Guide behaviour script potimeb/223300.lua

New file providing both the teleporter and the token turn-in. Teleport destinations are the original potimea port-in coords; the token jump mirrors tb_p4 (set lockouts, port the expedition, repop into Phase 4). Because the guide runs inside the instance, eq.get_expedition() and eq.get_zone_instance_id() are available.

-- Druzzil Ro guide (223300) - Phase 1 area teleporter + Phase 4 skip token
local AREAS = {
	earth  = {-35, 1636, 496, 124},
	air    = {-36, 1352, 496, 124},
	undead = {-27, 1103, 496, 124},
	water  = {-51,  857, 496, 124},
	fire   = {-55,  569, 496, 124},
}

function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("The plane is fractured into trials. I can send you to the [" ..
			eq.say_link("earth") .. "], [" .. eq.say_link("air") .. "], [" .. eq.say_link("undead") .. "], [" ..
			eq.say_link("fire") .. "], or [" .. eq.say_link("water") .. "] area.");
		return;
	end
	for name, loc in pairs(AREAS) do
		if (e.message:findi(name)) then
			e.other:MovePCInstance(223, eq.get_zone_instance_id(), loc[1], loc[2], loc[3], loc[4]);
			return;
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = <TOKEN_ID>})) then
		local dz = eq.get_expedition();
		if (dz.valid) then
			dz:AddLockout('Phase 1 Complete', 43200);
			dz:AddLockout('Phase 2 Complete', 475200);
			dz:AddLockout('Phase 3 Complete', 475200);
			local instance_id = eq.get_zone_instance_id();
			-- port the whole expedition (everyone in the instance) to the Phase 4 entrance
			for c in eq.get_entity_list():GetClientList().entries do
				if (c.valid and not c:GetGM()) then
					c:Message(MT.Yellow, "Time bends around you as Druzzil Ro pulls you forward.");
					c:MovePCInstance(223, instance_id, -395, 0, 350, 127);
				end
			end
			-- reboot the zone into Phase 4 (same as GM tb_p4 / ZoneReset)
			for i = 1, 14 do eq.spawn_condition("potimeb", instance_id, i, 0); end
			eq.depop_zone(false);
			eq.get_entity_list():GetSpawnByID(157394):Repop(2); -- zone_status
			eq.get_entity_list():GetSpawnByID(157395):Repop(2); -- zone_emoter
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end





The token jump sets the lockouts before the repop so the rebooted zone_status:event_spawn detects Phase 1/2/3 Complete and runs SpawnPhaseFour().



All five guides share this script, so the token can be handed to whichever one is nearest.



Implementation note to verify: eq.depop_zone(false) depops the guide itself, but the GetSpawnByID(...):Repop(2) calls operate on the persistent Spawn2 points (the same pattern ZoneReset uses from player.lua), so the controllers come back. If self-depop proves flaky on this build, fall back to deferring the repop via a short eq.set_timer before the depop, or route the repop through the GM ZoneReset path.

6. Remove the instance fail timers (and population cap)

All functional fail-timer logic lives in server/quests/potimeb/zone_status.lua. The goal: a raid can take as long as it wants and never be auto-failed/ported out. The DZ system's max_players=72 already enforces the headcount, so the in-zone player_check cap is removed along with the timer.

function UpdateFailTimer(minutes_to_add)
	total_time = (total_time + minutes_to_add);	
	eq.stop_timer("player_check");
	eq.set_timer("player_check", 10 * 1000); -- 10 Sec Player Check
	eq.GM_Message(MT.Lime,"fail_timer set to " .. (total_time) .. " minutes");	-- debug
	eq.set_timer("event_hb",60 * 1000); -- 60 Sec Timer Check
end

Steps:





Remove UpdateFailTimer and all ~22 call sites across the phase branches (lines 140, 147, 154, 166, 213, 224, 277, 353, 521-582). (Equivalent low-effort option: leave the calls and make the function body empty - but since the cap is also going, a clean delete is preferred.)



Delete the fail countdown: remove the entire if (e.timer == "event_hb") branch in event_timer (the total_time decrement, the hourly "hourglass... you have X left" eq.zone_emote announcements, the total_time == 10 warning, and the EventFailed() call).



Delete EventFailed() (its only caller is the removed countdown). The Quarm-completion "lockout" timer and SetZoneLockout()/ControllerDepop() remain untouched.



Remove the population cap: delete the if (e.timer == "player_check") branch in event_timer and the player_limit variable. Note this also drops the custom 54-player sub-cap that applied while Phase 1 trigger mobs were up; the DZ max_players (72) becomes the only cap, per the decision that the DZ enforces population.



Cleanup leftovers: drop the total_time reset in ResetVariables(), the eq.stop_timer("event_hb") / eq.stop_timer("player_check") calls, and the now-meaningless GM tb_mins/timer_echo toggle (signal 98). The echo/player-count toggle (signal 99) can stay or go since its only consumer was player_check.

7. Remove cosmetic time-left emoter text

In server/quests/potimeb/zone_emoter.lua, delete the now-inaccurate time-reference lines while keeping the rest of the flavor dialogue and the raidMove calls:





Line 16: "...You have one hour left."



Line 64: "...You have one additional hour."



Line 93: "...an additional one hour and fifteen minutes."



Lines 111 and 133: "...You have four additional hours."



Line 154: "...You have two additional hours."

For lines 64/93/111/133/154 the sentence is part of an "As the path before you opens up..." emote; strip just the trailing "You have ... hours/hour." sentence (or replace with a neutral "The path forward opens." line) so the transition emote still fires.

8. Apply / reload





Reload item + NPC caches (#reloadworld or restart world) so <TOKEN_ID> and npc type 223300 are recognized.



Reload quests (#reload quest) or bounce the potimeb zone for the Lua changes.

Important constraints / edge cases





NPC script precedence. The new guide must run 223300.lua, not the cutscene Druzzil_Ro.lua. EQEmu loads id-keyed scripts before name-keyed ones; verify this on the build (if the cutscene fires on spawn, give the npc type a distinct internal name instead of "Druzzil_Ro").



Token jump triggers a zone reboot. The skip depops/repops the instance to boot Phase 4, so any in-progress Phase 1 fights end immediately. Intended use is a fresh raid skipping straight in. Since the token is tradeable (not Lore), a raid could hold several; the jump is idempotent on lockouts, but two near-simultaneous hand-ins would each fire a repop - consider a short guard flag in the script if that matters.



Self-depop during repop. See the note in step 5 - mirrors the proven ZoneReset pattern, but verify the controllers respawn after the guide depops itself.



Members elsewhere. The jump ports every client currently inside the instance. Anyone still in potimea (not yet zoned in) will land in Phase 1 on entry; they can ride a guide teleport or just be near at hand-in time.



Lockout semantics. Using the token applies the standard weekly Phase 1-3 completion lockouts, consistent with actually clearing those phases.

