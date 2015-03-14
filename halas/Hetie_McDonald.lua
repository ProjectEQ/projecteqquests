function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome back, " .. e.other:GetName() .. ". Why don't you purchase a few things before you head out into the tundra again?");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
