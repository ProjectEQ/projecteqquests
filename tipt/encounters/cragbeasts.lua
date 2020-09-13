-- on live only one player is required to trigger spawns but this may be era dependent (1 makes it harder to bypass)
local trigger_player_count = 1

local function spawn_hatchlings()
  eq.spawn2(289034, 0, 0, -2008.0, 133.0, 250.0, 505.0):ChangeSize(3) -- NPC: a_cragbeast_hatchling
  eq.spawn2(289034, 0, 0, -1923.0, 138.0, 251.0, 53.0):ChangeSize(3)  -- NPC: a_cragbeast_hatchling
  eq.spawn2(289034, 0, 0, -2075.0, 168.0, 251.0, 507.0):ChangeSize(3) -- NPC: a_cragbeast_hatchling
  eq.spawn2(289034, 0, 0, -1944.0, 222.0, 251.0, 384.0):ChangeSize(3) -- NPC: a_cragbeast_hatchling
  eq.spawn2(289034, 0, 0, -2075.0, 235.0, 250.0, 212.0):ChangeSize(3) -- NPC: a_cragbeast_hatchling
  eq.spawn2(289034, 0, 0, -1978.0, 271.0, 251.0, 510.0):ChangeSize(3) -- NPC: a_cragbeast_hatchling
end

local function trigger_spawn(e)
  -- uses a timer instead of proximity event to make less predictive and behave like live
  eq.set_timer("check_proximity", 2000)
end

local function trigger_timer(e)
  -- only a single player is required on live but this is configurable for eras
  -- the emote range is 100 but trigger is 150 max distance (so not always seen)
  if e.timer == "check_proximity" then
    if #e.self:GetClientsInProximity(150) >= trigger_player_count then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "You have disturbed a nest.")
      spawn_hatchlings()
      eq.depop()
    end
  end
end

local function hatchling_death(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(289034) then -- NPC: #a_cragbeast_hatchling
    eq.spawn2(289036, 0, 0, -1964.0, 193.0, 250.0, 279.00):ChangeSize(8) -- NPC: #an_enraged_maternal_cragbeast
  end
end

function event_encounter_load(e)
  eq.register_npc_event("cragbeasts", Event.spawn, 289045, trigger_spawn) -- #aemc_trigger
  eq.register_npc_event("cragbeasts", Event.timer, 289045, trigger_timer) -- #aemc_trigger
  eq.register_npc_event("cragbeasts", Event.death_complete, 289034, hatchling_death) -- #a_cragbeast_hatchling
end
