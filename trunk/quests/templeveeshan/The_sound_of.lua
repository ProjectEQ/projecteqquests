-- The_sound_of NPCID: 124130
function event_spawn(e)
  local ex = e.self:GetX();
  local ey = e.self:GetY();
  local ez = e.self:GetZ();
  eq.set_proximity(ex - 30, ex + 30, ey - 30, ey + 30, ez - 30, ez + 30);
end

function event_enter(e)
  e.self:Emote("a thousand wings fills the halls.");
  eq.depop_with_timer();
end