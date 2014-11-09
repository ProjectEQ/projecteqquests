-- A_deafening_roar NPCID: 124135
function event_spawn(e)
  local ex = e.self:GetX();
  local ey = e.self:GetY();
  local ez = e.self:GetZ();
  eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
  e.self:Emote("fills the halls.");
  eq.depop_with_timer();
end