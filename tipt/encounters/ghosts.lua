-- on live only one player is required to trigger spawns but this may be era dependent (1 makes it harder to bypass)
local trigger_player_count = 1

local ghosts = {
  289035, -- an_arisen_beludu
  289040, -- a_feeble_beludu_shade
  290050  -- a_weeping_beludu_mother
}

local function get_random_ghost()
  return ghosts[math.random(#ghosts)]
end

local function spawn_ghosts()
  -- randomly spawns an_arisen_beludu, a_weeping_beludu_mother, or a_feeble_beludu_shade
  -- the mob that spawns after killing one of these is also randomly one of those three mobs
  local spawns = {}
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1391.0, 832.0, 396.0, 60.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1358.0, 940.0, 394.0, 135.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1310.0, 778.0, 396.0, 165.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1290.0, 768.0, 396.0, 452.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1310.0, 999.0, 396.0, 158.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1254.0, 931.0, 394.0, 353.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1215.0, 861.0, 396.0, 408.0)
  spawns[#spawns+1] = eq.spawn2(get_random_ghost(), 0, 0, -1292.0, 998.0, 396.0, 383.0)

  -- instead of using different mob type for spawned mobs, just set a flag on these
  for i=1,#spawns do
    if spawns[i].valid then
      spawns[i]:SetEntityVariable("spawn_on_death", "1")
      spawns[i]:CastToNPC():ModifyNPCStat("aggro", "150") -- aggro range on these is large -- 150ish
      spawns[i]:CastToNPC():ModifyNPCStat("see_invis_undead", tostring(math.random(0,1))) -- randomly see ivu
    end
  end
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
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Mournful wails carry on the air. While at first despairing, they rise quite suddenly to a menacing level.")
      spawn_ghosts()
      eq.depop()
    end
  end
end

local function ghost_death(e)
  if e.self:EntityVariableExists("spawn_on_death") then
    eq.spawn2(get_random_ghost(), 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
  else
    local entity_list = eq.get_entity_list()
    for i=1,#ghosts do
      if entity_list:IsMobSpawnedByNpcTypeID(ghosts[i]) then
        return -- ghost still alive
      end
    end

    -- talking to Garjah is not required. once the last ghost is killed the key room spawns
    eq.spawn2(289033, 0, 0, -1284.00, 904.00, 395.92, 170.00) -- #Garjah_Zotaki
    eq.signal(289044, 1) -- #zone_status (signal to spawn keyroom)
  end
end

function event_encounter_load(e)
  eq.register_npc_event("ghosts", Event.spawn, 289046, trigger_spawn) -- #ghost_trigger
  eq.register_npc_event("ghosts", Event.timer, 289046, trigger_timer) -- #ghost_trigger
  eq.register_npc_event("ghosts", Event.death_complete, 289035, ghost_death) -- #an_arisen_beludu
  eq.register_npc_event("ghosts", Event.death_complete, 289040, ghost_death) -- #a_feeble_beludu_shade
  eq.register_npc_event("ghosts", Event.death_complete, 290050, ghost_death) -- #a_weeping_beludu_mother
end
