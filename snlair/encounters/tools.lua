local tool_event_started = false

local spirits = {
  286005, -- a_Nihil_priest_spirit
  286030, -- a_Nihil_geomancer_spirit
  286001, -- a_Nihil_worker_spirit
  286007, -- a_Nihil_arcanist_spirit
}

local sludgeworkers = {
  286006, -- an_abandoned_sludgeworker
  286009, -- a_confused_sludgeworker
}

local insects = {
  286011, -- a_decaying_slimesnipper
  286002, -- a_slithering_stonemite
  286008, -- a_sewer_gnat
  286016, -- an_acid_larva
  286022, -- a_muck-covered_fly
}

local watermobs = {
  286057, -- a_grimy_turepta
  286053 -- a_sludge_lurker
}

local function get_spirit()
  return spirits[math.random(#spirits)]
end

local function get_sludgeworker()
  return sludgeworkers[math.random(#sludgeworkers)]
end

local function get_insect()
  return insects[math.random(#insects)]
end

local function get_watermob()
  return watermobs[math.random(#watermobs)]
end

local function spawn_non_tool_rooms()
  -- spawn condition mobs spawned by turn in (in packet order excluding tool room spawns)
  eq.spawn2(get_sludgeworker(), 0, 0, -170.0, 804.0, -16.0, 132.0)

  eq.spawn2(get_insect(), 0, 0, 577.0, 2408.0, -16.0, 511.0)
  eq.spawn2(get_insect(), 0, 0, 534.0, 2428.0, -16.0, 68.0)
  eq.spawn2(get_sludgeworker(), 0, 0, 517.0, 2442.0, -16.0, 107.0)

  eq.spawn2(get_spirit(), 0, 0, 745.0, 2446.0, -3.0, 394.0)
  eq.spawn2(get_spirit(), 0, 0, 700.0, 2415.0, -3.0, 4.0)
  eq.spawn2(get_spirit(), 0, 0, 773.0, 2501.0, -16.0, 386.0)

  eq.spawn2(get_insect(), 0, 0, 759.0, 2574.0, -16.0, 396.0)

  eq.spawn2(get_sludgeworker(), 0, 0, 733.0, 2648.0, -16.0, 324.0)

  eq.spawn2(get_spirit(), 0, 0, 634.0, 2664.0, -16.0, 251.0)
  eq.spawn2(get_spirit(), 0, 0, 590.0, 2606.0, -3.0, 261.0)
  eq.spawn2(get_spirit(), 0, 0, 592.0, 2559.0, -2.0, 264.0)
  eq.spawn2(get_spirit(), 0, 0, 524.0, 2541.0, -3.0, 134.0)
  eq.spawn2(get_spirit(), 0, 0, 529.0, 2586.0, -2.0, 257.0)
  eq.spawn2(get_spirit(), 0, 0, 644.0, 2783.0, 27.0, 77.0)
  eq.spawn2(get_spirit(), 0, 0, 646.0, 2894.0, 39.0, 129.0)
  eq.spawn2(get_spirit(), 0, 0, 768.0, 2901.0, 43.0, 394.0)
  eq.spawn2(get_spirit(), 0, 0, 779.0, 2799.0, 43.0, 254.0)

  eq.spawn2(get_insect(), 0, 0, 107.0, 470.25, -11.125, 0.0)

  -- these 6 have randomized spawn locations
  eq.spawn2(get_insect(), 0, 0, -478.375, 763.625, -54.875, 0.0) -- eq.spawn2(get_insect(), 0, 0, -637.625, 159.25, -55.125, 0.0)
  eq.spawn2(get_insect(), 0, 0, -598.125, 328.25,-55.125, 0.0)   -- eq.spawn2(get_insect(), 0, 0, -466.5, 358.75, -55.125, 0.0)
  eq.spawn2(get_watermob(), 0, 0, 117.5, 1354.25, -79.25, 0.0)   -- eq.spawn2(get_watermob(), 0, 0, -13.875, 1349.625, -79.375, 0.0)
  eq.spawn2(get_watermob(), 0, 0, -47.875, 1293.625, -89.0, 0.0) -- eq.spawn2(get_watermob(), 0, 0, -42.25, 1083.125, -41.25, 0.0)
  eq.spawn2(get_insect(), 0, 0, 574.375, 1354.375, 1.75, 0.0)    -- eq.spawn2(get_insect(), 0, 0, 863.125, 1188.25, 4.0, 0.0)
  eq.spawn2(get_insect(), 0, 0, 845.875, 1779.5, -13.875, 0.0)   -- eq.spawn2(get_insect(), 0, 0, 917.375, 1918.125, -13.875, 0.0)
end

local function spawn_sludgeworker_room()
  local spawns = {}
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, 61.0, 98.0, -16.0, 255.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, 154.0, 167.0, -16.0, 258.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, 254.0, 85.0, -16.0, 389.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, -94.0, 55.0, -16.0, 509.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, -99.0, 153.0, -16.0, 139.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, -91.0, -59.0, -16.0, 129.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, 7.0, -71.0, -16.0, 4.0)
  spawns[#spawns+1] = eq.spawn2(get_sludgeworker(), 0, 0, 114.0, -75.0, -16.0, 2.0)

  local tool_npc = spawns[math.random(#spawns)]
  tool_npc:SetEntityVariable("has_tools", "1") -- assign tools randomly to one of them
  eq.debug(string.format("Sludgeworker tools [%s] at [%.2f, %.2f, %.2f]",
    tool_npc:GetName(), tool_npc:GetX(), tool_npc:GetY(), tool_npc:GetZ()))
end

local function spawn_cocoon_room()
  local spawns = {}
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -624.0, 157.0, -58.0, 387.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -681.0, 111.0, -60.75, 125.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -767.0, 109.0, -58.0, 191.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -751.0, 29.0, -58.0, 142.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -750.0, -86.0, -58.0, 138.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -751.0, -154.0, -58.0, 73.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -694.0, -162.0, -58.0, 6.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -595.0, -141.0, -58.0, 15.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -508.0, -145.0, -58.0, 459.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -502.0, -68.0, -57.0, 390.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -508.0, 11.0, -51.0, 380.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -592.0, 13.0, -51.0, 503.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -585.0, 127.0, -45.0, 387.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -501.0, 114.0, -51.0, 329.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -602.0, -90.0, -74.0, 477.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -559.0, -11.0, -74.0, 341.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -716.0, -89.0, -72.0, 122.0)
  spawns[#spawns+1] = eq.spawn2(get_insect(), 0, 0, -674.0, 14.0, -74.0, 128.0)

  local tool_npc = spawns[math.random(#spawns)]
  tool_npc:SetEntityVariable("has_tools", "1") -- assign tools randomly to one of them
  eq.debug(string.format("Insect tools [%s] at [%.2f, %.2f, %.2f]",
    tool_npc:GetName(), tool_npc:GetX(), tool_npc:GetY(), tool_npc:GetZ()))
end

local function spawn_waterwheel_room()
  local spawns = {}
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 1083.0, 887.0, -1.0, 374.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 962.0, 897.0, -1.0, 126.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 891.0, 899.0, -1.0, 207.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 916.0, 701.0, -1.0, 85.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 977.0, 677.0, -1.0, 511.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 1074.0, 677.0, -1.0, 509.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 1110.0, 775.0, -1.0, 380.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 1019.0, 854.0, -17.0, 510.0)
  spawns[#spawns+1] = eq.spawn2(get_spirit(), 0, 0, 1026.0, 703.0, -15.0, 268.0)

  local tool_npc = spawns[math.random(#spawns)]
  tool_npc:SetEntityVariable("has_tools", "1") -- assign tools randomly to one of them
  eq.debug(string.format("Waterwheel tools [%s] at [%.2f, %.2f, %.2f]",
    tool_npc:GetName(), tool_npc:GetX(), tool_npc:GetY(), tool_npc:GetZ()))
end

local function trigger_spawn(e)
  -- on turn in the zone is despawned and replaced with these spawns
  -- depop all except us and alej -- eq.depop_zone(false
  local npc_list = eq.get_entity_list():GetNPCList()
  for npc in npc_list.entries do
    local npc_id = npc:GetNPCTypeID()
    if npc.valid and npc_id ~= e.self:GetNPCTypeID() and npc_id ~= 286098 then -- Alej_Leraji
      npc:Depop(false)
    end
  end

  spawn_sludgeworker_room()
  spawn_cocoon_room()
  spawn_waterwheel_room()
  spawn_non_tool_rooms()

  tool_event_started = true
end

local function spirit_death(e)
  if tool_event_started and e.self:EntityVariableExists("has_tools") then -- waterwheel room
    eq.signal(286098, 1) -- NPC: Alej Leraji
    eq.zone_emote(15, "As the nihil spirit falls, you catch a glimpse of an item in the corner of the room. You have acquired [" .. eq.say_link("Alej's Stone Breaking Powder Bag") .. "].")
  end
end

local function sludgeworker_death(e)
  if tool_event_started and e.self:EntityVariableExists("has_tools") then -- zone-in room
    eq.signal(286098, 1) -- NPC: Alej Leraji
    eq.zone_emote(15, "You hear a large thud as the golem crashes down on the hard stone floor. As the dust settles, a sparkle of an item appears in the front of the room. You have acquired [" .. eq.say_link("Alej's Stone Melding Orb") .. "].")
  end
end

local function insect_death(e)
  if tool_event_started and e.self:EntityVariableExists("has_tools") then -- cocoon room
    eq.signal(286098, 1) -- NPC: Alej Leraji
    eq.zone_emote(15, "The bug falls to the ground, revealing an item that seemed like it wasn't there before. You have acquired [" .. eq.say_link("Alej's Stone Shaping Sceptre") .. "].")
  end
end

function event_encounter_load(e)
  eq.register_npc_event("tools", Event.spawn, 286104, trigger_spawn) -- #lair_trigger

  for i=1,#spirits do
    eq.register_npc_event("tools", Event.death_complete, spirits[i], spirit_death)
  end

  for i=1,#sludgeworkers do
    eq.register_npc_event("tools", Event.death_complete, sludgeworkers[i], sludgeworker_death)
  end

  for i=1,#insects do
    eq.register_npc_event("tools", Event.death_complete, insects[i], insect_death)
  end
end
