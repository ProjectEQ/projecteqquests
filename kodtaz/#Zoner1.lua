function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 10, x + 10, y - 10,  y + 10)
end

function event_enter(e)
  e.other:MovePCDynamicZone("ikkinz", 0, false) -- Zone: ikkinz group 1 version
end
