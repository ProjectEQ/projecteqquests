-- Instance-scoped quest globals and zone data buckets.
-- Open world (instance_id == 0): bare global keys, "zone-ow-suffix" data keys.
-- Instanced zones: "{instance_id}_suffix" globals, "zone-{id}-suffix" data keys.

local QuestScope = {}

local function zone_short_name()
  return eq.get_zone():GetShortName()
end

function QuestScope.instance_id()
  return eq.get_zone_instance_id() or 0
end

function QuestScope.is_instance()
  return QuestScope.instance_id() > 0
end

function QuestScope.global_key(base_name, zone_name)
  zone_name = zone_name or zone_short_name()
  local id = QuestScope.instance_id()
  if id > 0 then
    return id .. "_" .. base_name
  end
  return base_name
end

function QuestScope.data_key(suffix, zone_name)
  zone_name = zone_name or zone_short_name()
  local id = QuestScope.instance_id()
  if id > 0 then
    return zone_name .. "-" .. id .. "-" .. suffix
  end
  return zone_name .. "-ow-" .. suffix
end

function QuestScope.get_global(qglobals, base_name, zone_name)
  return qglobals[QuestScope.global_key(base_name, zone_name)]
end

function QuestScope.set_global(base_name, value, save_type, duration, zone_name)
  eq.set_global(QuestScope.global_key(base_name, zone_name), value, save_type, duration)
end

function QuestScope.delete_global(base_name, zone_name)
  eq.set_global(QuestScope.global_key(base_name, zone_name), "0", 1, "S1")
end

function QuestScope.get_data(suffix, zone_name)
  local v = eq.get_data(QuestScope.data_key(suffix, zone_name))
  if v == nil or v == "" then
    return nil
  end
  return v
end

function QuestScope.set_data(suffix, value, duration, zone_name)
  eq.set_data(QuestScope.data_key(suffix, zone_name), tostring(value), duration)
end

function QuestScope.delete_data(suffix, zone_name)
  eq.delete_data(QuestScope.data_key(suffix, zone_name))
end

function QuestScope.set_fail_deadline(event_prefix, duration_seconds, ttl, zone_name)
  local fail_at = os.time() + duration_seconds
  QuestScope.set_data(event_prefix .. "_fail_at", fail_at, ttl, zone_name)
  return fail_at
end

function QuestScope.remaining_seconds(event_prefix, zone_name)
  local fail_at = QuestScope.get_data(event_prefix .. "_fail_at", zone_name)
  if fail_at == nil then
    return nil
  end
  local remaining = tonumber(fail_at) - os.time()
  if remaining < 0 then
    return 0
  end
  return remaining
end

function QuestScope.clear_event(event_prefix, zone_name)
  zone_name = zone_name or zone_short_name()
  QuestScope.delete_data(event_prefix .. "_wave", zone_name)
  QuestScope.delete_data(event_prefix .. "_fail_at", zone_name)
  QuestScope.delete_global(event_prefix .. "_wave", zone_name)
end

return QuestScope
