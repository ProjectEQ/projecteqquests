-- npc id: 293228 (Ikkinz group trial 3 zoner)
function event_spawn(e)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 10, x + 10, y - 10,  y + 10)
end

function event_enter(e)
  local dz_version = instance_version.ikkinz_chambers_of_the_tri_fates
  e.other:MovePCDynamicZone("ikkinz", dz_version, false) -- Zone: ikkinz group 3 version
end
