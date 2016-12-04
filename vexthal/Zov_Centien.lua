function event_death(e)
  local xloc = e.self:GetX();
  local yloc = e.self:GetY();
  local zloc = e.self:GetZ();
  local heading = e.self:GetHeading();
  eq.spawn2(eq.ChooseRandom(158099,158098,158097),0,0,xloc,yloc,zloc,heading);
end
