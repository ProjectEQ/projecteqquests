function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Good day t'ye. " .. e.other:GetCleanName() .. "!  'Tis sure good t'see ye here.  I've been doin' a bit of thinkin' about the past.  Ah yes. me past t'would surprise even ye.  Alas. I cannae dwell on it now.  I am Barrith the Brave.  I must be searchin' for a hero worthy of havin' the eyes of the gods upon them.");
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
