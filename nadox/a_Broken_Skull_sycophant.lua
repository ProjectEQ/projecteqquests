function event_death_complete(e)
  local which = math.random(100);
  if  (which <= 2) then
    eq.unique_spawn(227302, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --#A_Broken_Skull_Peer (227302)
  end
end
