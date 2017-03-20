function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("adds", 15 * 1000);
	else
		eq.stop_timer("adds");
	end
end

function event_timer(e)
	if (e.timer == "adds") then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		local zloc = e.self:GetZ();
		local heading = e.self:GetHeading();
		eq.spawn2(336213,0,0,xloc,yloc,zloc,heading);
	end
end
