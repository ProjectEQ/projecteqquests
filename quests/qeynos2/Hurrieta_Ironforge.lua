function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing back here?! I cannot stand it when the children allow their friends to run rampant on our estate. Please leave!");
	elseif(e.message:findi("tayla")) then
		e.self:Say("Tayla! She is no Ironforge.");
	elseif(e.message:findi("weleana")) then
		e.self:Say("Waleana is a stain on Brohan's life. A horrid elf. She is gone now and Brohan has moved onto better things and more sanity.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 22) then
		e.self:Say("My roses are growing quite well.");
	end
end
