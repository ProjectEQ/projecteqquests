local waypoints = {
  west = { x = 258.625, y = -26.125, z = -18.625, h = 352.0 }, -- first wp dest for west spawns
  east = { x = 199.0,   y = 22.0,    z = -24.625, h = 248.0 }, -- first wp dest for east spawn
  last = { x = 230.0,   y = -56.875, z = -21.0,   h = 77.0 },  -- final depop loc for circle
}

local spawns = {
  east      = { x = -926.0, y = -4.0,   z = 2.0,   h = 119.0, wp = waypoints.east },
  north     = { x = 791.0,  y = 477.0,  z = -88.0, h = 283.0, wp = waypoints.west },
  northwest = { x = 1958.0, y = 827.0,  z = -76.0, h = 101.0, wp = waypoints.west },
  west      = { x = 1632.0, y = -627.0, z = -179.0,h = 241.0, wp = waypoints.west },
}

local drakes = { -- npc ids
  level_70 = 343087,
  level_71 = 343723,
  level_72 = 343724,
  level_73 = 343725,
  level_75 = 343090,
}

-- Wave 1: Level 70, Wave 2: Level 71, Wave 3: Level 72, Wave 4: Level 73, Wave 5: Level 75, Circle: Level 1
local waves = {
  { npc_id = 0,               update = 0, next_secs = 25,  spawns = { } }, -- first wave just sets delay
  { npc_id = drakes.level_70, update = 0, next_secs = 90,  spawns = { spawns.east, spawns.north } },
  { npc_id = drakes.level_71, update = 1, next_secs = 120, spawns = { spawns.east, spawns.north, spawns.northwest, spawns.west } },
  { npc_id = drakes.level_72, update = 2, next_secs = 120, spawns = { spawns.east, spawns.north, spawns.northwest, spawns.west } },
  { npc_id = drakes.level_73, update = 3, next_secs = 90,  spawns = { spawns.north, spawns.northwest, spawns.west, spawns.east, spawns.east } },
  { npc_id = drakes.level_75, update = 4, next_secs = 0,   spawns = { spawns.north, spawns.northwest, spawns.west, spawns.east, spawns.east } },
}

local circle_locs = {
  { x = 147.0, y = -26.0,  z = -30.0, h = 160.0 },
  { x = 211.0, y = -110.0, z = -24.0, h = 15.0 },
  { x = 307.0, y = -65.0,  z = -17.0, h = 465.0 },
  { x = 288.0, y = 32.0,   z = -18.0, h = 338.0 },
  { x = 199.0, y = 22.0,   z = -26.0, h = 248.0 },
}

local kill_last_wave = 5 -- task element id

local dz_task_id     = 0
local next_wave_time = 0
local wave_count     = 1
local circle_count   = 0
local drake_count    = 0 -- killing 16 of the 20 drake spawns results in success
local started        = false

local function get_clients(gm_bypass)
  local clients = {}
  local has_gm = false
  for client in eq.get_entity_list():GetClientList().entries do
    clients[#clients+1] = client
    if client:GetGM() then
      if gm_bypass and not has_gm then
        eq.debug(("Client %s with GM flag enabled in zone, bypassing client count requirement"):format(client:GetName()))
      end
      has_gm = true
    end
  end
  return clients, has_gm
end

local function update_task(element_id)
  -- update one client since shared tasks update all members
  -- this will break the mission if all clients die/leave due to way shared tasks currently work
  if element_id > 0 then
    local clients = get_clients()
    for _, client in ipairs(clients) do
      if client:IsTaskActivityActive(dz_task_id, element_id) then
        client:UpdateTaskActivity(dz_task_id, element_id, 1)
        break
      end
    end
  end
end

local function add_circle_drake(drake)
  circle_count = circle_count + 1

  if circle_count == 1 then
    eq.zone_emote(MT.Yellow, "The first drake takes its place in the circle.")
  elseif circle_count == 2 then
    eq.zone_emote(MT.Yellow, "The second drake takes its place in the circle.")
  elseif circle_count == 3 then
    eq.zone_emote(MT.Yellow, "The third drake takes its place in the circle, you can feel the magic increasing around you.")
  elseif circle_count == 4 then
    eq.zone_emote(MT.Yellow, "The fourth drake takes its place in the circle, you can feel their spell is nearing its end.")
  elseif circle_count == 5 then
    eq.zone_emote(MT.Yellow, "As the final drake takes its place in the circle the ground trembles beneath your feet and energy shoots into the sky.")
    eq.end_dz_task() -- todo: live closes dz and kicks clients but not mission, touching switch outside starts a new dz (requires source changes)
  end

  drake:Depop()

  local circle = circle_locs[circle_count]
  if circle then
    eq.spawn2(343726, 0, 0, circle.x, circle.y, circle.z, circle.h) -- drake_magus (level 1)
  end
end

local function spawn_wave(wave)
  for _, spawn in ipairs(wave.spawns) do
    local drake = eq.spawn2(wave.npc_id, 0, 0, spawn.x, spawn.y, spawn.z, spawn.h)
    drake:CastToNPC():MoveTo(spawn.wp.x, spawn.wp.y, spawn.wp.z, spawn.wp.h, true)
    drake:SetEntityVariable("wp", "1")
    eq.set_timer("check_wp", 500, drake)
  end
end

local function controller_spawn(e)
  eq.set_timer("tick", 5 * 1000)
end

local function controller_timer(e)
  if not started then
    local clients, has_gm = get_clients(true)
    if #clients >= 3 or has_gm then
      eq.zone_emote(MT.Yellow, "You hear the flapping of wings in the distance.")
      started = true
    end
  elseif started and wave_count <= #waves then
    local now = os.time()
    if now >= next_wave_time then
      eq.zone_emote(MT.Yellow, "The flapping in the distance builds as the wind picks up.")
      local wave = waves[wave_count]
      spawn_wave(wave)
      update_task(wave.update)
      next_wave_time = now + wave.next_secs
      wave_count = wave_count + 1
      eq.debug(("[%s] wave: %d next_wave_time: %s"):format(os.date("%X", now), wave_count - 1, os.date("%X", next_wave_time)))
    end
  end
end

local function drake_combat(e)
  if e.joined then
    eq.set_timer("deaggro", 30 * 1000)
  else
    e.self:MoveTo(e.self:GetWaypointX(), e.self:GetWaypointY(), e.self:GetWaypointZ(), e.self:GetWaypointH(), true)
  end
end

local function drake_timer(e)
  if e.timer == "deaggro" then
    eq.stop_timer("deaggro")
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Drake magus focuses its attention once again on reaching its spot in the circle.")
    e.self:WipeHateList()
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
    eq.set_timer("reenable_aggro", 8 * 1000)
  elseif e.timer == "reenable_aggro" then
    eq.stop_timer("reenable_aggro")
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
  elseif e.timer == "check_wp" and not e.self:IsEngaged() and not e.self:IsMoving() then
    -- event_waypoint_arrive breaks from combat and only works with first MoveTo
    if e.self:CalculateDistance(e.self:GetWaypointX(), e.self:GetWaypointY(), e.self:GetWaypointZ()) < 5 then
      local wp = tonumber(e.self:GetEntityVariable("wp")) or 0
      if wp == 1 then
        e.self:SetEntityVariable("wp", "2")
        e.self:MoveTo(waypoints.last.x, waypoints.last.y, waypoints.last.z, waypoints.last.h, true)
      elseif wp == 2 then
        eq.stop_timer("check_wp")
        add_circle_drake(e.self)
      end
    end
  end
end

local function drake_death(e)
  drake_count = drake_count + 1
  eq.debug("drake kill count: " .. drake_count)
  if drake_count == 16 then
    eq.zone_emote(MT.Yellow, "As the magic of the drakes fails you see an object appear at the center of their circle")
    eq.unique_spawn(343173, 0, 0, 230.0, -57.0, -22.0, 0.0) -- Draconic_Focus
    update_task(kill_last_wave)
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.spawn,          343392, controller_spawn) -- #Event_Controller
  eq.register_npc_event(Event.timer,          343392, controller_timer)
  for _, drake_npc_id in pairs(drakes) do
    eq.register_npc_event(Event.combat,         drake_npc_id, drake_combat) -- drake_magus
    eq.register_npc_event(Event.timer,          drake_npc_id, drake_timer)
    eq.register_npc_event(Event.death_complete, drake_npc_id, drake_death)
  end
end
