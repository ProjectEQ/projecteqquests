function event_death_complete(e)
local xloc = e.self:GetX();
local yloc = e.self:GetY();
local zloc = e.self:GetZ();
local heading = e.self:GetHeading();
local add=eq.ChooseRandom(158119,158120,158121,158122,158123,158124)
eq.spawn2(add,0,0,xloc,yloc,zloc,heading);
eq.debug("death: " .. e.self:GetName() .. " add: " .. add);
end
