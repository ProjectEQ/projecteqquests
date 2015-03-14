function event_waypoint_arrive(e)
	if(e.wp == 1 or e.wp == 7) then
		e.self:SetRunning(true);
	elseif(e.wp == 4 or e.wp == 10) then
		e.self:SetRunning(false);
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
