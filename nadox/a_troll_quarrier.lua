function event_death_complete(e)
  local which = math.random(100);
  if  (which <= 2) then
    eq.unique_spawn(227308, 0, 0, e.self:GetX(), e.self:GetY(),  e.self:GetZ(),  e.self:GetHeading()); --#Crew_Chief_Hanriesaf (227308)
  end
end
