function event_death_complete(e)
  local which = math.random(100);
  if  (which <= 2) then
    eq.unique_spawn(227311, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --#First_Mate_Bresanev (227311)
  end
end
