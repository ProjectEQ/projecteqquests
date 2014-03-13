-- Converted to .lua by Speedz

function event_waypoint_arrive(e)
	if(e.wp == 30) then
		e.self:Say("Click.. Dust. Dust. Dust.");
	elseif(e.wp == 42) then
		e.self:Say("Click.. Dust. Dust. Dust.");
		e.self:SetRunning(true);
	end
end
