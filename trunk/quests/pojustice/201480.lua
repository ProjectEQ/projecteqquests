function event_waypoint_arrive(e)
	if (e.wp == 12) then
		eq.signal(201450, 5);
	end
end

function event_death_complete(e)
	eq.signal(201450, 901);
end
