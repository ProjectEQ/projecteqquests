function event_death_complete(e)
	-- send a signal to the #water_trigger that I died
	eq.signal(223172,1);
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	if (e.hp_event == 91) then
		-- spawn 2 a_deepwater_triloun
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc - 15,zloc,heading);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn 2 a_deepwater_triloun
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223100,223115),0,0,xloc,yloc - 15,zloc,heading);
	end
end
