function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Say("Come along, fiend. We haven't far to go.");
		eq.signal(1201,4);
	end
end
