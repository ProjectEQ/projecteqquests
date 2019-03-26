function event_waypoint_arrive(e)
	if(e.wp == 4) then
		e.self:Say("Come along, prisoner.");
		eq.signal(1183,1); -- NPC: #Riley_Shplots
	end
end
