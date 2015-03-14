function event_death_complete(e)
	-- send a signal to the #earth_trigger that I died
	eq.signal(223169,1);
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	-- spawn between 2 and 4 a_rock_shaped_assassin
	local split_count = eq.ChooseRandom(2,3,4);
	for i = 1, split_count, 1 do
		if (i == 1) then
			eq.spawn2(223147,0,0,xloc,yloc+5,zloc,heading);
		elseif (i == 2) then
			eq.spawn2(223147,0,0,xloc,yloc-5,zloc,heading);
		elseif (i == 3) then
			eq.spawn2(223147,0,0,xloc,yloc+10,zloc,heading);
		elseif (i == 4) then
			eq.spawn2(223147,0,0,xloc,yloc-10,zloc,heading);
		end
	end
end
