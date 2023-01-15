-- every 250s (4m10s) a zone emote occurs and npcs are chosen to walk to NW bridge gate where they depop
-- if enough npcs depop and there's not enough mobs left in zone the mission fails with an emote
-- npcs are depopped by a proximity timer if dragged to the bridge and then aggro dropped
--
-- 1) it's unknown how many npcs are chosen per emote or if it's random
-- 2) failure can occur with more than 50 npcs remaining in zone (at zero kills)
--    maybe live doesn't count npcs that are already moving to bridge as remaining?
-- 3) failure without killing any npcs takes about an hour depending on randomness of npcs chosen/pathing
-- 4) grids for pathing have a large impact on pacing of npcs arriving at gate, some npcs walk around zone
-- 5) kicking everyone from task results in fail zone emotes when all npcs are dead and task is completed
--    indicates task state may be queried to get kill count and is used in timer checks
-- 6) live spams failure zone emote every 5s on two separate timers (one originates from #Holy_Hour_Invis)
--    probably from both a gate proximity timer and a fail check timer sharing logic?

local task_ended = false
local killed_count = 0 -- track kill count (should use task state but complex and depends on clients in zone)
local zone_controller_id = 10 -- hardcoded in source
local holy_hour_invis_id = 340433 -- #Holy_Hour_Invis
local bridge = { x = 856.625, y = 1278.375, z = 5.375, h = 57.5 } -- bridge gate depop destination
local corner = { x = 694.625, y = 976.0, z = 19.5, h = 30.0 } -- corner of building (mimic live pathing)

local function get_npcs(pred)
  local npcs = {}
  local exclude_npcs = { [zone_controller_id] = true, [holy_hour_invis_id] = true }
  local npc_list = eq.get_entity_list():GetNPCList()
  for npc in npc_list.entries do
    if not exclude_npcs[npc:GetNPCTypeID()] and not npc:IsPet() then
      if not pred or pred(npc) then
        npcs[#npcs+1] = npc
      end
    end
  end
  return npcs
end

-- choose 7 random npcs to moved to northwest bridge door (unconfirmed number chosen)
local function move_npcs()
  local chosen = 0
  local npcs = get_npcs()
  while chosen < 7 and chosen < #npcs do
    local index = math.random(#npcs)
    local npc = npcs[index]
    if npc:IsEngaged() or npc:GetEntityVariable("wp") then
      table.remove(npcs, index)
    else
      npc:SetRunning(false)
      -- npcs already near bridge walk to it, all others move to the corner to mimic live paths
      if npc:GetY() > 1100 and npc:GetX() > 700 then
        npc:SetEntityVariable("wp", "2")
        npc:MoveTo(bridge.x, bridge.y, bridge.z, bridge.h, true) -- gate depop destination
      else
        npc:SetEntityVariable("wp", "1")
        npc:MoveTo(corner.x, corner.y, corner.z, corner.h, true) -- corner of temple
      end
      chosen = chosen + 1
    end
  end
end

-- this is a hack to make npcs start moving to the bridge if at corner waypoint
-- npcs that engage in combat after a MoveTo to the corner will no longer trigger waypoint_arrive
local function scan_waypoint()
  local dist = 30
  get_npcs(function(npc)
    if not npc:IsEngaged() and not npc:IsMoving() and npc:GetEntityVariable("wp") == "1" and npc:CalculateDistance(corner.x, corner.y, corner.z) < dist then
      npc:SetEntityVariable("wp", "2")
      npc:MoveTo(bridge.x, bridge.y, bridge.z, bridge.h, true) -- gate depop destination
    end
    return false
  end)
end

local function scan_bridge()
  local dist = 30 -- proximity to bridge loc to depop
  local depopped = 0

  local remaining_npcs = get_npcs(function(npc)
    if not npc:IsEngaged() and npc:CalculateDistance(bridge.x, bridge.y, bridge.z) < dist then
      eq.get_entity_list():MessageClose(npc, true, 100, MT.SayEcho, ("%s passes the barrier and crosses over the bridge."):format(npc:GetCleanName()))
      npc:Depop()
      depopped = depopped + 1
      return false
    end
    return true
  end)

  if depopped > 0 then
    eq.debug(("npcs depopped (%d) -- remaining: %d killed: %d"):format(depopped, #remaining_npcs, killed_count))
  end
end

local function check_failed()
  -- if there's not enough npcs left to complete the mission (50 kills) then fail
  -- task kill count would be more reliable but requires clients in zone
  local remaining_npcs = get_npcs()
  if #remaining_npcs + killed_count < 50 then
    -- live spams failure emote (looks like every 5s on two separate timers, one from #Holy_Hour_Invis)
    eq.zone_emote(MT.Yellow, "Too many worshipers have crossed the bridge, there are no longer enough on the island to allow you to meet your goal.")
    if not task_ended then
      eq.end_dz_task()
      task_ended = true
    end
  end
end

local function zone_death(e)
  if not e.killed:IsPet() then
    killed_count = killed_count + 1 -- shared task state would be more reliable
  end
end

local function holy_hour_spawn(e)
  eq.set_timer("move_npcs", 250 * 1000) -- every 250s (4m10s)
  eq.set_timer("scan_bridge", 5 * 1000) -- bridge proximity check
  eq.set_timer("check_failed", 5 * 1000) -- check failed
  eq.set_timer("scan_waypoint", 500) -- corner waypoint arrive check
end

local function holy_hour_timer(e)
  if e.timer == "move_npcs" then
    eq.zone_emote(MT.Yellow, "A low, deep gonging sound rebounds off the walls.  The faint, distant chanting that you realize you have been hearing for a while now, increases in volume for a moment, then fades again.")
    move_npcs()
  elseif e.timer == "scan_bridge" then
    scan_bridge()
    check_failed() -- live spams from two zone emote timers on fail
  elseif e.timer == "scan_waypoint" then
    scan_waypoint()
  elseif e.timer == "check_failed" then
    check_failed()
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, zone_controller_id, zone_death)
  eq.register_npc_event(Event.spawn,      holy_hour_invis_id, holy_hour_spawn)
  eq.register_npc_event(Event.timer,      holy_hour_invis_id, holy_hour_timer)
end
