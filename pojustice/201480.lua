function event_waypoint_arrive(e)
	if (e.wp == 12) then
		eq.signal(201450, 5); -- NPC: #Event_Torture_Control
	end
end

function event_death_complete(e)
	eq.signal(201450, 901); -- NPC: #Event_Torture_Control
end
