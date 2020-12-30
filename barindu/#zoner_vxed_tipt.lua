local vxed_tipt_zones = { [289] = true, [290] = true }

function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 25, x + 25, y - 25, y + 25)
end

function event_enter(e)
  local dz = e.other:GetExpedition()
  if dz.valid and vxed_tipt_zones[dz:GetZoneID()] then
    e.other:MovePCDynamicZone(dz:GetZoneID())
  end
end
