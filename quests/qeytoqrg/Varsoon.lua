function event_death_complete(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local hloc = e.self:GetHeading();

	eq.spawn2(4190,105,0,xloc,yloc,zloc,hloc);
end
