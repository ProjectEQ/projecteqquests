function event_say(e)
	if(e.message:findi("lavaspinners")) then
		--You have been assigned the task 'Lavaspinner Research'.
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	elseif(e.message:findi("shadowed men")) then
		--You have been assigned the task 'Lurking in the Shadows'.
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	elseif(e.message:findi("tasks")) then
		e.self:Say("Our tasks are to find out as much information about the creatures in Lavastorm as we can.  I have been scouting [".. eq.say_link("shadowed men") .."], [".. eq.say_link("lavaspinners") .."], [".. eq.say_link("war drakes") .."], and [".. eq.say_link("goblins") .."]");
	elseif(e.message:findi("creatures")) then
		e.self:Say("I was under disguise in Neriak when Tani N`Mar tasked me out with this detail  If I had refused it I might not have escaped out of Neriak.  I decided to follow through on the [".. eq.say_link("tasks") .."]");
	elseif(e.message:findi("goblins")) then
		--You have been assigned the task 'Scouting the Goblins'.
		e.self:Say("Unfortunately, I do not yet have this task to give you.");
	elseif(e.message:findi("hail")) then
		e.self:Say("It took you long enough to get here and you don't look like much of a scout.  You should do fine for the [".. eq.say_link("creatures") .."]");
	end
end