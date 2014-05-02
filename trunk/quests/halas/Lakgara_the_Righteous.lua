function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Greetings. " .. e.other:GetName() .. "! I am Lakgara the Righteous. I have returned to Norrath after many years to find those who are deemed worthy to be recognized by the gods. Those in the Realm of Heroes shall speak the names of those humble adventurers.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
