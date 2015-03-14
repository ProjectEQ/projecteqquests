function event_waypoint_arrive(e)
	if(e.wp == 55 or e.wp == 117) then
		e.self:SetRunning(true);
	elseif(e.wp == 82) then
		e.self:SetRunning(false);
	end
end