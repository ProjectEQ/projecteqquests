-- the animals randomly deaggro and return to their spot near sharalla's corpse
-- when deaggro, they become immune to aggro/combat until their next process tick (5s)
-- a "bite" occurs if any animals are within 30 range of corpse during corpse's check (5s)
-- at 10 bites the event fails

-- notable live behavior/possible bugs:
-- 1) the polar bear moves to the corpse, then immediately starts to path (walking)
-- away in dungeon. it sometimes runs back and then starts pathing or warps away.
-- this looks more like a bug with finding its destination by the corpse and not intent
-- 2) one of the ravenous snow cougars doesn't attack corpse (but still counts for bites)

local event_started = false
local total_bites = 0
local animals_dead = 0

-- locations the animals move to when they spawn/deaggro to start biting corpse
local animals = {
  [237793] = { -88, -930.875, 54.75, 295.25 }, -- a_starving_polar_bear
  [237794] = { -81, -941.875, 54.75, 390 }, -- #a_ravenous_snow_cougar
  [237795] = { -105, -948.0, 54.75, 99.575}, -- #a_ravenous_snow_cougar
  [237796] = { -111, -936.875, 54.75, 154.0 }  -- a_famished_leopard
}

local function make_attackable(mob, attackable)
  mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
end

local function depop_event()
  eq.depop(237773) -- Sharalla`s_corpse
  eq.depop(237772) -- Sharalla`s_warder
  for animal_id,_ in pairs(animals) do
    eq.depop(animal_id)
  end
end

function warder_say(e)
  if e.message:findi("hail") and not event_started then
    eq.get_entity_list():MessageClose(e.self, true, 100, 15, "It is odd that Sharalla's warder remains here after her demise.  It seems to be defending its master's remains.  The warder turns toward you as it notices your presence.  The moment it is distracted, several wild animals that had been hiding nearby lunge forth.")
    eq.spawn2(237793, 0, 0, -137, -868, 54, 216) -- a_starving_polar_bear
    eq.spawn2(237794, 0, 0, -6, -879, 52, 383)   -- #a_ravenous_snow_cougar
    eq.spawn2(237795, 0, 0, 7, -872, 51, 350)    -- #a_ravenous_snow_cougar
    eq.spawn2(237796, 0, 0, -59, -792, 49, 281)  -- a_famished_leopard

    eq.signal(237773, 1) -- Sharalla`s_corpse (start proximity timer)
    event_started = true
  end
end

function corpse_signal(e)
  eq.set_timer("check_proximity", 5000)
end

function corpse_timer(e)
  -- check for any of the animals within 30 range every 5s and increment bites
  local npc_list = eq.get_entity_list():GetNPCList()
  for npc in npc_list.entries do
    if npc.valid and animals[npc:GetNPCTypeID()] then
      local dist = npc:CalculateDistance(e.self:GetX(), e.self:GetY(), e.self:GetZ())
      if dist <= 20 then
        eq.get_entity_list():MessageClose(e.self, true, 100, 15, "One of the feral animals gnaws the remains of Sharalla, tearing at her clothes and skin.  Her warder utters a pitiful whine.")
        total_bites = total_bites + 1
        break
      end
    end
  end

  if total_bites >= 10 then
    eq.zone_emote(15, "Sharalla's remains have been irreversibly defiled by the wild animals. You have failed to protect her.")
    eq.signal(237743, 5) -- Durgin_Skell (warder event failed)
    depop_event()
  end
end

function animal_spawn(e)
  local loc = animals[e.self:GetNPCTypeID()]
  e.self:SetRunning(true)
  e.self:MoveTo(loc[1], loc[2], loc[3], loc[4], true)

   -- reduce aggro and assist range, they prioritize the corpse
  e.self:CastToNPC():ModifyNPCStat("aggro", "10")
  e.self:CastToNPC():ModifyNPCStat("assist", "10")

  eq.set_timer("process", 5000)
end

function animal_combat(e)
  if e.joined then
    e.self:SetEntityVariable("combat", "1")
    eq.stop_timer("combat_animation")
  else
    e.self:SetEntityVariable("combat", "0")
  end
end

-- deaggro condition is a random check every 5s (not sure on exact chance)
-- once deaggro, the animal is non-aggroable
function animal_timer(e)
  if e.timer == "process" then
    local in_combat = (e.self:GetEntityVariable("combat") == "1")
    if in_combat and math.random(3) == 1 then -- 33%, might need to adjust based on live
      -- leave combat and move to our bite position by Sharalla's corpse
      local loc = animals[e.self:GetNPCTypeID()]
      e.self:WipeHateList()
      e.self:MoveTo(loc[1], loc[2], loc[3], loc[4], true)
      e.self:SetEntityVariable("immune", "1")
      make_attackable(e.self, false)
    elseif not in_combat then
      -- first tick after de-aggroing removes immune state
      local is_immune = (e.self:GetEntityVariable("immune") == "1")
      if is_immune then
        e.self:SetEntityVariable("immune", "0")
        make_attackable(e.self, true)
      end

      -- simulate attack on Sharalla's corpse (assume we'd be stopped at destination)
      if not e.self:IsMoving() then
        eq.set_timer("combat_animation", 1000) -- live looks like actual combat (fast attacks)
      end
    end
  elseif e.timer == "combat_animation" then
    local animations = { 6, 8 } -- animDualWield and animHand2Hand (from packets)
    e.self:DoAnim(animations[math.random(#animations)])
  end
end

function animal_death(e)
  animals_dead = animals_dead + 1
  if animals_dead == 4 then
    eq.signal(237743, 4) -- Durgin_Skell (warder event success)
    depop_event()
  end
end

function event_encounter_load(e)
  eq.register_npc_event("sharalla", Event.say, 237772, warder_say) -- Sharalla`s_warder

  eq.register_npc_event("sharalla", Event.signal, 237773, corpse_signal) -- Sharalla`s_corpse
  eq.register_npc_event("sharalla", Event.timer, 237773, corpse_timer) -- Sharalla`s_corpse

  for animal_type_id,_ in pairs(animals) do
    eq.register_npc_event("sharalla", Event.spawn, animal_type_id, animal_spawn)
    eq.register_npc_event("sharalla", Event.combat, animal_type_id, animal_combat)
    eq.register_npc_event("sharalla", Event.timer, animal_type_id, animal_timer)
    eq.register_npc_event("sharalla", Event.death_complete, animal_type_id, animal_death)
  end
end
