function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Welcome. " .. e.other:GetName() .. "! If there is a sketch you are looking for. you should be able to find it here.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
