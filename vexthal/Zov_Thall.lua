function event_death_complete(e)
  local xloc = e.self:GetX();
  local yloc = e.self:GetY();
  local zloc = e.self:GetZ();
  local heading = e.self:GetHeading();
  local add=eq.ChooseRandom(158102,158101,158100,158103,158104)
  eq.spawn2(add,0,0,xloc,yloc,zloc,heading);
  eq.debug("death: " .. e.self:GetName() .. " add: " .. add);
end
