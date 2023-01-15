local sewer_zones = { [285] = true, [286] = true, [287] = true, [288] = true }

function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 10, x + 10, y - 10, y + 10)
end

function event_enter(e)
  local dz = e.other:GetExpedition()
  if dz.valid and sewer_zones[dz:GetZoneID()] then
    e.other:MovePCDynamicZone(dz:GetZoneID())
  end
end
