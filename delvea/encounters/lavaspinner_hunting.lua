local kill_count = 0
local egg_count = 0

-- spider kill requirement ranges to spawn an egg (doubles can spawn at boundaries)
local egg_kill_req = {
  { min = 5,  max = 10 },
  { min = 10, max = 15 },
  { min = 15, max = 25 },
  { min = 25, max = 35 }, -- pristine
}

-- list of live egg spawn locations (unsure if complete)
local cracked_locs = {
  { x = -956.0,  y = -1349.0, z = -79.0, h = 463.0 },
  { x = -1569.0, y = -1473.0, z = -95.0, h = 144.0 },
  { x = -1178.0, y = -940.0,  z = -13.0, h = 191.0 },
  { x = -1252.0, y = -1674.0, z = -34.0, h = 61.0  },
  { x = -1383.0, y = -872.0,  z = -14.0, h = 442.0 },
  { x = -1276.0, y = -1225.0, z = -93.0, h = 452.0 },
  { x = -1699.0, y = -1185.0, z = -38.0, h = 13.0  },
  { x = -1582.0, y = -815.0,  z =  22.0, h = 87.0  },
  { x = -1295.0, y = -1398.0, z = -83.0, h = 243.0 },
}

local function spawn_egg()
  eq.zone_emote(MT.Yellow, "The ground shakes slightly, and a loud crack and thud can be heard echoing through the tunnels.")
  if egg_count < 3 then
    local index = math.random(#cracked_locs)
    local loc = cracked_locs[index]
    table.remove(cracked_locs, index)
    eq.spawn2(341068, 0, 0, loc.x, loc.y, loc.z, loc.h) -- unhatched_lavaspinner_eggs (Cracked Lavaspinner Egg)
  else
    eq.spawn2(341069, 0, 0, -1481.0, -1520, -103, 0) -- unhatched_lavaspinner_eggs (Pristine Lavaspinner Egg)
  end
  egg_count = egg_count + 1
end

local function try_spawn_eggs()
  for egg_number, req in ipairs(egg_kill_req) do
    if egg_count < egg_number and kill_count >= req.min then
      local chance = 1 / (req.max - kill_count + 1) -- 100% at kill_count == max
      local roll = math.random()
      eq.debug(("rolling to spawn egg %d: roll: %f chance: %f"):format(egg_number, roll, chance))
      if roll < chance then
        spawn_egg()
      end
    end
  end
end

local function zone_death(e)
  if egg_count < 4 and not e.killed:IsPet() and e.killed:GetName():find("lavaspinner") then
    kill_count = kill_count + 1
    eq.debug("kill count: " .. kill_count)
    try_spawn_eggs()
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, 10, zone_death) -- zone_controller (hardcoded id)
end
