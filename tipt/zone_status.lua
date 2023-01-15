-- NPCID: 289044 #zone_status
local ikaavs = {
  289001, -- an_ikaav_irelette
  289016, -- an_ikaav_fleshflare
  289039  -- an_ikaav_psychagonist
}

local aneuks = {
  289002, -- an_aneuk_fleshweaver
  289038  -- an_aneuk_ebonspirit
}

local function get_random_ikaav()
  return ikaavs[math.random(#ikaavs)]
end

local function get_random_aneuk()
  return aneuks[math.random(#aneuks)]
end

local function spawn_keyroom()
  local spawns = {}
  spawns[#spawns+1] = eq.spawn2(289042, 0, 0, -747.00, 1515.00, 541.27, 284.00) -- NPC: a_mastruq_decapitator
  spawns[#spawns+1] = eq.spawn2(get_random_ikaav(), 0, 0, -677.00, 1558.00, 541.25, 391.00)
  spawns[#spawns+1] = eq.spawn2(289004, 0, 0, -671.00, 1595.00, 542.72, 420.00) -- NPC: a_ra`tuk_decimator
  spawns[#spawns+1] = eq.spawn2(289042, 0, 0, -699.00, 1625.00, 540.89, 233.00) -- NPC: a_mastruq_decapitator
  spawns[#spawns+1] = eq.spawn2(get_random_ikaav(), 0, 0, -750.00, 1598.00, 541.06, 34.00)
  spawns[#spawns+1] = eq.spawn2(get_random_aneuk(), 0, 0, -804.00, 1577.00, 542.56, 263.00)
  spawns[#spawns+1] = eq.spawn2(get_random_ikaav(), 0, 0, -845.00, 1596.00, 541.17, 276.00)
  spawns[#spawns+1] = eq.spawn2(get_random_aneuk(), 0, 0, -889.00, 1559.00, 543.13, 271.00)
  spawns[#spawns+1] = eq.spawn2(289004, 0, 0, -889.00, 1510.00, 543.29, 504.00) -- NPC: a_ra`tuk_decimator
  spawns[#spawns+1] = eq.spawn2(289042, 0, 0, -876.00, 1647.00, 541.00, 112.00) -- NPC: a_mastruq_decapitator

  -- randomly choose one of the spawned npcs to give the key to
  local index = math.random(#spawns)
  spawns[index]:CastToNPC():AddItem(54083, 1) -- Item: Harshly Spiked Key
  eq.debug(("Harshly Spiked Key given to npc: [%s] (%s)"):format(spawns[index]:GetName(), spawns[index]:GetID()))
end

function event_spawn(e)
  -- proximity triggers for events and emotes
  eq.spawn2(289045, 0, 0, -2011.0, 156.0, 250.75, 15.0)  -- #aemc_trigger
  eq.spawn2(289046, 0, 0, -1489.0, 883.0, 395.50, 125.0) -- #ghost_trigger
  eq.spawn2(289047, 0, 0, -792.0, 1396.0, 539.50, 15.0)  -- #aneuk_trigger
end

function event_signal(e)
  if e.signal == 1 then -- signal from ghost encounter when all ghosts are killed
    spawn_keyroom()
  end
end
