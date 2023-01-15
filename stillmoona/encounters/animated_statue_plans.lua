local kill_count = 0
local worker = 0

local function zone_npc_death(e)
  if kill_count < 25 and not e.killed:IsPet() then
    kill_count = kill_count + 1
    eq.debug("kill count: " .. kill_count)
    if kill_count == 25 then
      eq.zone_emote(MT.Yellow, "You hear a commotion coming from some where in the sand gardens...")
      eq.unique_spawn(338418, 0, 0, -467, 1290, 4, 258) -- a_goblin_warlord
    end
  end
end

local function worker_spawn(e)
  worker = worker + 1
  e.self:SetEntityVariable("worker", tostring(worker))
  eq.set_timer("speech", 49 * 1000) -- every 49s all three goblins say their line
end

local function worker_timer(e)
  local which = tonumber(e.self:GetEntityVariable("worker")) or 0
  if which == 1 then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A goblin worker says, 'More sand!  We need more sand for the statue!'")
  elseif which == 2 then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A goblin worker says, 'Ignore the adventurers.  We must complete the statue!'")
  elseif which == 3 then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A goblin worker says, 'Oops!  I hope that didn't damage the statue.'")
  end
end

local function warlord_combat(e)
  -- note on live killing the warlord too fast can brick the mission since it repops guard
  -- if warlord dies before it triggers the new guard then the statue never activates
  if e.joined then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A goblin warlord says, 'How dare you invade our temple and defile it with your presence!  You will all pay!  Guard!  Retrieve reinforcements!'")
    eq.signal(338216, 1) -- signal a_goblin_guard to run to statue
  end
end

local function guard_signal(e)
  e.self:SetRunning(true)
  e.self:MoveTo(-428.875, 697, 5, 128, true)
end

local function guard_arrive(e)
  eq.debug("guard arrived")
  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "A goblin guard says, 'Quick!  Get that statue going!  We have intruders in our midst!'")
  eq.depop()
  eq.depop_all(338229) -- a_goblin_worker
  eq.signal(338231, 1) -- signal to a_stone_statue to make attackable and run to warlord area
end

local function statue_signal(e)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
  e.self:CastToNPC():ModifyNPCStat("aggro", "350") -- huge los aggro range while running to dest
  e.self:SetRunning(true)
  e.self:MoveTo(-462.875, 1240.875, 8.75, 505, true)
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone,      10,     zone_npc_death) -- zone_controller
  eq.register_npc_event(Event.spawn,           338229, worker_spawn)   -- a_goblin_worker
  eq.register_npc_event(Event.timer,           338229, worker_timer)   -- a_goblin_worker
  eq.register_npc_event(Event.combat,          338418, warlord_combat) -- a_goblin_warlord
  eq.register_npc_event(Event.signal,          338216, guard_signal)   -- a_goblin_guard
  eq.register_npc_event(Event.waypoint_arrive, 338216, guard_arrive)   -- a_goblin_guard
  eq.register_npc_event(Event.signal,          338231, statue_signal)  -- a_stone_statue
end
