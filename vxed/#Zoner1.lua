function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 40, x + 40, y - 40, y + 40)
end

function event_enter(e)
  e.other:MovePC(283, -1258.00, 456.00, -119.54, 240.0) -- Zone: barindu
end
