function event_waypoint_arrive(e)
	if(e.wp == 10) then
		local which = math.random(1,3);
    		if  (which == 1) then
        		e.self:Say("Hail, soldier. You are relieved of duty, please report back to this post at the end of my shift.");
		    elseif (which == 2) then
 			      e.self:Say("Your shift has ended. Have a good evening, and good work today.");
		    elseif (which == 3) then
 			      e.self:Say("Good evening, time for you to leave. Get some sleep.");
		    end
   end
end
