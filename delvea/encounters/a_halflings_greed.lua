local gold    = 341103 -- #a_gold_chest
local cracked = 341102 -- #a_cracked_chest
local gilded  = 341101 -- #a_gilded_chest
local silver  = 341100 -- #a_silver_chest
local chest_order = { gold, cracked, gilded, silver }
local inspect_message = {
  [gold]    = "Afore gold is platinum and silver after both.",
  [cracked] = "An inscription on the chest reads: 256 - 16 - 4 -",
  [gilded]  = "I'm not the first nor the last, but I'm second to none.",
  [silver]  = "One step forward, and two steps back. Two steps brings you ahead, but farther back.",
}

-- todo: possibly handle in db with randomized spawn conditions for chest + guards
-- each chest is guarded by 1 strong and 2 weak guards
-- a_treasure_guardian, a_treasure_overseer, a_treasure_firespinner, a_treasure_firestorm, a_treasure_firebender
local guard_strong = { 341096, 341098, 341150, 341151, 341153 } -- different special abilities

-- a_treasure_sneak, a_treasure_keeper, a_treasure_fireguard, a_treasure_minder, a_treasure_protector
local guard_weak   = { 341094, 341095, 341097, 341099, 341152 }

local guard_locs = {
  { -- chest at { x = -1666.0, y = -1156.0, z = -37.375, h = 313.0 },
    { x = -1683.0, y = -1176.0, z = -36.875,  h = 252.0, npcs = guard_strong },
    { x = -1666.0, y = -1193.0, z = -37.125,  h = 477.0, npcs = guard_weak },
    { x = -1713.0, y = -1181.0, z = -37.0,    h = 477.0, npcs = guard_weak },
  },
  { -- chest at { x = -1244.0, y = -1692.0, z = -33.5, h = 495.0 },
    { x = -1270.0, y = -1672.0, z = -32.0,    h = 66.0,  npcs = guard_strong },
    { x = -1228.0, y = -1687.0, z = -32.375,  h = 33.0,  npcs = guard_weak },
    { x = -1243.0, y = -1651.0, z = -32.625,  h = 80.0,  npcs = guard_weak },
  },
  { -- chest at { x = -960.0,  y = -1355.0, z = -79.25, h = 508.5 },
    { x = -971.0,  y = -1340.0, z = -77.0,    h = 476.0, npcs = guard_strong },
    { x = -959.0,  y = -1315.0, z = -77.0,    h = 425.0, npcs = guard_weak },
    { x = -997.0,  y = -1344.0, z = -76.75,   h = 480.0, npcs = guard_weak },
  },
  { -- chest at { x = -1446.0, y = -1565.0, z = -100.375, h = 33.0 },
    { x = -1441.0, y = -1529.0, z = -100.625, h = 17.0,  npcs = guard_strong },
    { x = -1412.0, y = -1527.0, z = -98.125,  h = 123.0, npcs = guard_weak },
    { x = -1490.0, y = -1564.0, z = -101.125, h = 447.0, npcs = guard_weak },
  },
  { -- chest at { x = -1581.0, y = -850.0,  z = 22.0, h = 56.0   },
    { x = -1569.0, y = -818.0,  z = 23.875,   h = 74.0,  npcs = guard_strong },
    { x = -1553.0, y = -841.0,  z = 24.25,    h = 29.0,  npcs = guard_weak },
    { x = -1573.0, y = -793.0,  z = 22.375,   h = 121.0, npcs = guard_weak },
  },
  { -- chest at { x = -1914.0, y = -1845.0, z = -158.25, h = 49.0 },
    { x = -1901.0, y = -1824.0, z = -156.5,   h = 49.0,  npcs = guard_strong },
    { x = -1927.0, y = -1837.0, z = -157.625, h = 53.0,  npcs = guard_weak },
    { x = -1913.0, y = -1868.0, z = -157.5,   h = 53.0,  npcs = guard_weak },
  }
}

local chest_locs = {
  { x = -1666.0, y = -1156.0, z = -37.375,  h = 313.0, guards = guard_locs[1] },
  { x = -1244.0, y = -1692.0, z = -33.5,    h = 495.0, guards = guard_locs[2] },
  { x = -960.0,  y = -1355.0, z = -79.25,   h = 508.5, guards = guard_locs[3], animated = true }, -- chest at this loc rapidly changes heading
  { x = -1446.0, y = -1565.0, z = -100.375, h = 33.0 , guards = guard_locs[4] },
  { x = -1581.0, y = -850.0,  z = 22.0,     h = 56.0 , guards = guard_locs[5] },
  { x = -1914.0, y = -1845.0, z = -158.25,  h = 49.0 , guards = guard_locs[6] },
}

local function cursed_spawn(e)
  -- spawn randomized chests
  for _, chest_id in ipairs(chest_order) do
    local index = math.random(#chest_locs)
    local loc = chest_locs[index]
    local chest = eq.unique_spawn(chest_id, 0, 0, loc.x, loc.y, loc.z, loc.h)
    if loc.animated then
      eq.set_timer("animated", 100, chest)
    end
    for _, guard in ipairs(loc.guards) do
      eq.spawn2(guard.npcs[math.random(#guard.npcs)], 0, 0, guard.x, guard.y, guard.z, guard.h)
    end
    table.remove(chest_locs, index)
  end
end

local function chest_timer(e)
  -- not sure if live animation is a pathing bug or intentional
  -- timers are capped to 100ms which is too slow to fully mimic live's animation
  local x, y, z, h = e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()
  local new_heading = math.random(0, 55)
  if h < 400 then
    new_heading = math.random(464, 511)
  end
  e.self:GMMove(x, y, z, new_heading) -- SetHeading doesn't work
end

local function tarpo_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tarpo Fiddengrab looks weak and his breathing is labored. 'You must help me. I came here to check a map I found and while I was here, I found a treasure chest. I inspected it and found it was protected by a strange riddle.  I answered it and opened the chest. I went further and found another, but I did now know the answer to open it, so I picked the lock. That's when it [happened].'")
  elseif e.message:findi("happened") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tarpo Fiddengrab says, 'Well, I've been plagued by a horrible spell.  I managed to crawl back here, but I cannot leave. I tried, but the curse got stronger. I believe we need to find the answer to the treasures kept here.  I have seen four chests.  You must solve their mystery.  I believe that you can free me of this curse if you do... and uhm, maybe share your findings?'")
  end
end

local function chest_open(e)
  local opened_id = e.self:GetNPCTypeID()
  for _, chest_id in ipairs(chest_order) do
    if opened_id == chest_id then
      eq.debug(("chest %d opened in correct order"):format(opened_id))
      break
    elseif eq.get_entity_list():IsMobSpawnedByNpcTypeID(chest_id) then
      -- mission fail if any previous chest still spawned
      eq.debug(("chest %d opened out of order (chest %d still spawned)"):format(opened_id, chest_id))
      e.self:SpellFinished(6801, e.self) -- Meddler's Misfortune (pbae)
      eq.end_dz_task()
      break
    end
  end
end

local function chest_inspect(e)
  local msg  = inspect_message[e.other:GetNPCTypeID()]
  if msg then
    e.self:Message(MT.Yellow, msg)
    return 1
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn,          341104,  cursed_spawn) -- #a_cursed_chest (controller)
  eq.register_npc_event(Event.say,            341107,  tarpo_say)    -- #Tarpo_Fiddengrab
  eq.register_npc_event(Event.death_complete, gold,    chest_open)
  eq.register_npc_event(Event.death_complete, cracked, chest_open)
  eq.register_npc_event(Event.death_complete, gilded,  chest_open)
  eq.register_npc_event(Event.death_complete, silver,  chest_open)
  eq.register_npc_event(Event.timer,          gold,    chest_timer)
  eq.register_npc_event(Event.timer,          cracked, chest_timer)
  eq.register_npc_event(Event.timer,          gilded,  chest_timer)
  eq.register_npc_event(Event.timer,          silver,  chest_timer)
  eq.register_player_event(Event.inspect, chest_inspect)
end
