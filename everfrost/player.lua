local expeditions = { mirb = true, mirc = true, mirg = true }

function event_click_door(e)
  local door_id = e.door:GetDoorID()
  if door_id == 3 then
    local dz = e.self:GetExpedition()
    if dz.valid and expeditions[dz:GetZoneName()] then
      e.self:MovePCDynamicZone(dz:GetZoneID())
    end
  end
end
