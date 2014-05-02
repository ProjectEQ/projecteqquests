function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hello. " .. e.other:GetName() .. ". I'm a maker of weapon molds. Care to view my wares?");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
