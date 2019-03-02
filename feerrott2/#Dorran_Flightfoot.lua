function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Renn, ".. e.other:GetName() ..", to our humble home away from home.  My mate, Kavri, and I are here on a little adventure of our own.  Unfortunately, it's not as pleasant as I had hoped.  There's some tension in the area regarding the [".. eq.say_link("lizardman patrols") .."].");
	elseif(e.message:findi("lizardman patrols")) then
		e.self:Say("The lizardman patrols are becoming problematic.  They simply have no respect for the other beings in the area and seem to be causing an imbalance.  Could you [".. eq.say_link("thin them out") .."] a little?  That might even things up a bit and allow us to continue our work.");
	elseif(e.message:findi("thin them out")) then	
		e.self:Say("Your help is much appreciated, ".. e.other:GetName() ..".  Please let us know how it goes.");
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
		--You have been assigned the task 'A Panting Lizard'.
	end
end