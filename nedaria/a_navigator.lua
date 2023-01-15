function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail, ".. e.other:GetName() .. ".  I heard the tales of some enterprising fishermen while they waited for the boat to the Abysmal Sea.  Now, I've heard some tall tales, but theirs are by far the most outrageous.  I hardly believed a word!");	
	end
end
