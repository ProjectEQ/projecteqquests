-- npc id: 293228 (Ikkinz group trial 3 zoner)
function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 10, x + 10, y - 10,  y + 10)
end

function event_enter(e)
  e.other:MovePCDynamicZone("ikkinz", 2, false) -- Zone: ikkinz group 3 version
end
