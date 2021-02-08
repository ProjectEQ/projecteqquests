function event_death_complete(e)
  local which = math.random(2);
  if  (which == 1) then
    eq.spawn2(123021, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: an_amorphous_mass
  elseif (which == 2) then
    eq.spawn2(123021, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: an_amorphous_mass
    eq.spawn2(123021, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); -- NPC: an_amorphous_mass
  end
end
