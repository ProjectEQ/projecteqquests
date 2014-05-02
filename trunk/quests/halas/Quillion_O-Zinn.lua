function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day to you. " .. e.other:GetName() .. "! If you are looking for fishing supplies. you've come to the right place. And if you have a successful day. I will gladly pay for your catch.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
