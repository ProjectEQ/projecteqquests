function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, Brell protect us!  It's a slaughter out there.  The [".. eq.say_link("threat") .."] is so great.  I've never seen it quite this bad in Fear.");
	elseif(e.message:findi("threat")) then
		e.self:Say("They're putting up quite a fight today, and Cazic's bloodthirsty slaughter of mortals just [".. eq.say_link("empowers them") .."].");	
	elseif(e.message:findi("empowers them")) then
		e.self:Say("I mean pretty much anyone native to this plane.  I suppose the biggest threat against my fellowship has been the [".. eq.say_link("Amygdalans") .."] and [".. eq.say_link("fetid fiends") .."].");	
	elseif(e.message:findi("Amygdalans")) then		
		e.self:Say("The Amygdalans took down a few of our friends, and it took all the priests could muster to save the rest of us.  If you wish to [".. eq.say_link("take down") .."] several of them, we may be able to go in and search for the bodies of our fallen groupmates.");
	elseif(e.message:findi("take down")) then
		--You have been assigned the task 'Corpse Camped'.
		e.self:Say("Your assistance is greatly appreciated, ".. e.other:GetName());
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	elseif(e.message:findi("fetid fiends")) then
		e.self:Say("They stopped us in our tracks in trying to progress forward, leaving us somewhat trapped in our current position.  Something needs to be done with them, and quickly.  Will you [".. eq.say_link("help") .."]?");
	elseif(e.message:findi("help")) then
		--You have been assigned the task 'Pushing Onwards'.
		e.self:Say("Thank you so much.  It means a lot to us.");
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	end
end