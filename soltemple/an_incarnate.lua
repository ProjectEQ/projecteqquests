-- 1 is no pop , 2 is 1 repop, 3 is 2 repop

function event_death_complete(e)
  local which = math.random(3);
  if  (which == 2) then
    eq.spawn2(80043, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: an_incarnate
  elseif (which == 3) then
    eq.spawn2(80043, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: an_incarnate
    eq.spawn2(80043, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: an_incarnate
  end
end
