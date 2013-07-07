function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings..  I am Nostahla Westfend, understudy of Gahlith, and Second Master Wizard of the Order of Three.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 3) then
		eq.set_anim(1121,1);
	elseif(e.wp == 4) then
		eq.set_anim(1121,0);
	elseif(e.wp == 16) then
		e.self:Say("Gahlith, I'm going down to the docks to see if Ghul has anything new from overseas today. I'll be back in a little while.");
	end
end
