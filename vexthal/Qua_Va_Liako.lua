function event_death(e)
local xloc = e.self:GetX();
local yloc = e.self:GetY();
local zloc = e.self:GetZ();
local heading = e.self:GetHeading();
eq.spawn2(eq.ChooseRandom(158119,158120,158121,158122,158123,158124),0,0,xloc,yloc,zloc,heading); 
end
