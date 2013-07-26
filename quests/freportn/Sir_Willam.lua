function event_waypoint_arrive(e)
	if(e.wp == 170) then
		e.self:SetRunning(true);
	elseif(e.wp == 186) then
		e.self:SetRunning(false);
	end
end
