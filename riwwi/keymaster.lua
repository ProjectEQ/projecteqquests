local BIC_ITEM_ID        = 52154
local RESPAWN_SECONDS    = 91 * 60
local CHECK_INTERVAL_MS  = 5 * 1000
local TIMER_NAME         = "bic_check"
local COOLDOWN_KEY       = "riwwi_ground_spawn"

-- {x, y, z, heading, decay_ms}
local SPAWN_LOCS = {
  {-1,   -201,   1,  0, 5400000},
  {-129,  625,  71,  0, 5400000},
  {-736, -327,   0,  0, 5400000},
  {-172, -233,  18,  0, 5400000},
  {-678,  495, -36,  0, 5400000},
}

local function is_item_on_ground(item_id)
  local list = eq.get_entity_list():GetObjectList()
  if not list or not list.entries then return false end
  for obj in list.entries do
    if obj.valid and obj:GetItemID() == item_id then
      return true
    end
  end
  return false
end

local function spawn_random_ground_item(item_id)
  local idx = math.random(#SPAWN_LOCS)
  eq.create_ground_object(item_id, unpack(SPAWN_LOCS[idx]))
end

local function cooldown_active()
  return eq.get_data(COOLDOWN_KEY) ~= nil
end

local function start_cooldown()
  eq.set_data(COOLDOWN_KEY, "1", RESPAWN_SECONDS)
end

function event_spawn(e)
  eq.set_timer(TIMER_NAME, CHECK_INTERVAL_MS)

  if not is_item_on_ground(BIC_ITEM_ID) and not cooldown_active() then
    spawn_random_ground_item(BIC_ITEM_ID)
    start_cooldown()
  end
end

function event_timer(e)
  if e.timer ~= TIMER_NAME then return end

  local item_present = is_item_on_ground(BIC_ITEM_ID)

  if not item_present and not cooldown_active() then
    spawn_random_ground_item(BIC_ITEM_ID)
    start_cooldown()
  end
end
