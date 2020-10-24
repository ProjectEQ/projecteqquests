function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 10, x + 10, y - 10,  y + 10)
end

function event_enter(e)
  local dz_version = instance_version.ikkinz_chambers_of_singular_might
  e.other:MovePCDynamicZone("ikkinz", dz_version, false) -- Zone: ikkinz group 1 version
end
