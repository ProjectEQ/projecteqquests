-- NPCID: 289044 #zone_status
local function spawn_keyroom()
  local spawns = {}
  spawns[#spawns+1] = eq.spawn2(289042, 0, 0, -747.00, 1515.00, 541.27, 284.00) -- NPC: a_mastruq_decapitator
  spawns[#spawns+1] = eq.spawn2(289042, 0, 0, -699.00, 1625.00, 540.89, 233.00) -- NPC: a_mastruq_decapitator
  spawns[#spawns+1] = eq.spawn2(289042, 0, 0, -876.00, 1647.00, 541.00, 112.00) -- NPC: a_mastruq_decapitator
  spawns[#spawns+1] = eq.spawn2(289039, 0, 0, -677.00, 1558.00, 541.25, 391.00) -- NPC: an_ikaav_psychagonist
  spawns[#spawns+1] = eq.spawn2(289004, 0, 0, -889.00, 1510.00, 543.29, 504.00) -- NPC: a_ra`tuk_decimator
  spawns[#spawns+1] = eq.spawn2(289004, 0, 0, -671.00, 1595.00, 542.72, 420.00) -- NPC: a_ra`tuk_decimator
  spawns[#spawns+1] = eq.spawn2(289038, 0, 0, -889.00, 1559.00, 543.13, 271.00) -- NPC: an_aneuk_fleshweaver
  spawns[#spawns+1] = eq.spawn2(289016, 0, 0, -845.00, 1596.00, 541.17, 276.00) -- NPC: an_ikaav_fleshflare
  spawns[#spawns+1] = eq.spawn2(289016, 0, 0, -750.00, 1598.00, 541.06, 34.00)  -- NPC: an_ikaav_fleshflare
  spawns[#spawns+1] = eq.spawn2(289002, 0, 0, -804.00, 1577.00, 542.56, 263.00) -- NPC: an_aneuk_ebonspirit

  -- randomly choose one of the spawned npcs to give the key to
  local index = math.random(#spawns)
  spawns[index]:CastToNPC():AddItem(54083, 1) -- Item: Harshly Spiked Key
  eq.debug("Harshly Spiked Key given to npc: " .. spawns[index]:GetName())
end

function event_spawn(e)
  -- proximity triggers for events and emotes
  eq.spawn2(289045, 0, 0, -2011.0, 156.0, 250.75, 15.0)  -- #aemc_trigger
  eq.spawn2(289046, 0, 0, -1489.0, 883.0, 395.50, 125.0) -- #ghost_trigger
  eq.spawn2(289047, 0, 0, -792.0, 1396.0, 539.50, 15.0)  -- #aneuk_trigger

  -- todo: database, mobs in key room should not be spawned by default
  eq.set_timer("depop_ebonspirits", 5000)
end

function event_signal(e)
  if e.signal == 1 then
    spawn_keyroom()
  end
end

function event_timer(e)
  if e.timer == "depop_ebonspirits" then
    eq.debug("Depopping aneuk ebonspirits from key room (Remove this when database updated)")
    eq.stop_timer("depop_ebonspirits")
    eq.depop_all(289002) -- NPC: an_aneuk_ebonspirit
  end
end
