function event_death_complete(e)
	-- send a signal to the #fire_trigger that I died
	eq.signal(223173,1);
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	-- spawn both a_flame_mephit and an_inferno_mephit
	eq.spawn2(223089,0,0,xloc,yloc+5,zloc,heading);
	eq.spawn2(223095,0,0,xloc,yloc-5,zloc,heading);
end
