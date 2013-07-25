function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
end

function event_spawn(e)
	eq.set_next_hp_event(51);
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	if (e.hp_event == 51) then
		-- spawn copies
		eq.spawn2(223164,0,0,xloc,yloc - 25,zloc,heading);
		eq.spawn2(223164,0,0,xloc,yloc + 25,zloc,heading);
	end
end
