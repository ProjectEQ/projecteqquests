-- decay times are total elapsed seconds that a Dark Lady has been held by a client in zone
-- (e.g. first dark lady decays 30-35s depending on tick after pickup, then decays again 1m30s later)
-- note: live adds time for multiple dark ladys so decay time accmulates like a counter
local decay_table = {
  { item_id = 81896, next_id = 81897, decay_time = 30                }, -- Dark Lady
  { item_id = 81897, next_id = 81898, decay_time = eq.seconds("2m")  }, -- Drooping Dark Lady
  { item_id = 81898, next_id = 81899, decay_time = eq.seconds("5m")  }, -- Sickly Dark Lady
  { item_id = 81899, next_id = 81900, decay_time = eq.seconds("10m") }, -- Wilted Dark Lady
  { item_id = 81900, next_id = 81901, decay_time = eq.seconds("20m") }, -- Withered Dark Lady -> Dead Dark Lady
}

local kill_count = 0
local dark_lady_time = 0 -- total seconds Dark Lady has been in zone on any client (more like a counter)

local function simple_task_spawn(e)
  eq.set_timer("process", 5 * 1000)
end

-- 1) Dark Lady time is incremented if a client in zone has one during check
-- 2) Zoning out with the Dark Lady pauses decay and zoning back in resumes where it left off
-- 3) Decay time increments for each Dark Lady per check (decays faster with multiple)
--    e.g. if 1 client has 2 Dark Lady items, each 5s check increments dark lady time +10 instead of +5
-- 4) Live limits to one decay on a client per tick, so it will decay once every 5s up to current decay state
local function simple_task_timer(e)
  local where = bit.bor(InventoryWhere.Personal, InventoryWhere.Cursor)
  local increment = 0 -- total increment for all Dark Ladys found this loop

  local client_list = eq.get_entity_list():GetClientList()
  for client in client_list.entries do
    local decayed = false -- one decay for client per loop
    local inv = client:GetInventory()
    for i, dark_lady in ipairs(decay_table) do
      if inv:HasItem(dark_lady.item_id, 1, where) ~= -1 then
        eq.debug(("[%s] %s has Dark Lady item: %d decays at: %d decay time: %d"):format(os.date('%H:%M:%S'), client:GetName(), dark_lady.item_id, dark_lady.decay_time, dark_lady_time))

        -- we don't break early on decay because client may have multiple Dark Ladys that each increment time
        if not decayed and dark_lady_time > dark_lady.decay_time then
          eq.debug(("[%s] Decaying Dark Lady on client: %s"):format(os.date('%H:%M:%S'), client:GetName()))
          if i ~= #decay_table then -- last decay to Dead Dark Lady does not send message
            client:Message(MT.Yellow, "The Dark Lady withers.  It is only a matter of time before is dies.  You know you must hurry and find a way to plant it properly.")
          end
          client:RemoveItem(dark_lady.item_id)
          client:SummonItem(dark_lady.next_id)
          decayed = true
        end

        increment = increment + 5 -- add elapsed for each Dark Lady
      end
    end
  end

  dark_lady_time = dark_lady_time + increment
end

-- Master Courier spawns after a number of npcs have been killed near garden.
-- live requires either waiting for respawns or dragging npcs to the area
local function zone_death(e)
  local min_x = 1760 -- only kills near garden area beyond (west of) this x position count
  local req_kills = 41 -- number of kills in garden area to trigger Master Courier spawn
  if kill_count < req_kills and e.killed:GetX() > min_x and not e.killed:IsPet() then
    kill_count = kill_count + 1
    eq.debug("total kill count near garden: " .. kill_count)
    if kill_count == req_kills then
      eq.zone_emote(MT.Yellow, "A loud, hissing voice shouts, 'What is going on here?  Someone shall answer to the Lady of the Tempest for their actions here!'")
      eq.unique_spawn(340005, 19, 0, 2438.0, -174.0, 175.0, 256.0) -- #Master_Courier
    end
  end
end

-- todo: add proper master courier grid to db and remove this (this mimics it a little)
local function master_courier_arrive(e)
  if e.self:GetGrid() == 19 and e.wp == 3 then
    e.self:AssignWaypoints(17) -- switch to grid 17 inside garden
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone,      10,     zone_death)            -- zone_controller (hardcoded id)
  eq.register_npc_event(Event.spawn,           340570, simple_task_spawn)     -- #Simple_Task_Invis
  eq.register_npc_event(Event.timer,           340570, simple_task_timer)
  eq.register_npc_event(Event.waypoint_arrive, 340005, master_courier_arrive) -- #Master_Courier
end
