function event_death(e)
local xloc = e.self:GetX();
local yloc = e.self:GetY();
local zloc = e.self:GetZ();
local heading = e.self:GetHeading();
eq.spawn2(eq.ChooseRandom(158105,158106,158107,158108,158109),0,0,xloc,yloc,zloc,heading);
end
