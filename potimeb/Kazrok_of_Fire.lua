function event_death_complete(e)
	-- send a signal to the #fire_trigger that I died
	eq.signal(223173,2);
end

function event_spawn(e)
	eq.set_next_hp_event(76);
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	if (e.hp_event == 76) then
		-- spawn 2 of either a_flame_mephit_ or an_inferno_mephit_
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,xloc,yloc - 15,zloc,heading);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn 2 of either a_flame_mephit_ or an_inferno_mephit_
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,xloc,yloc - 15,zloc,heading);
		eq.set_next_hp_event(21);
	elseif (e.hp_event == 21) then
		-- spawn 2 of either a_flame_mephit_ or an_inferno_mephit_
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223094,223163),0,0,xloc,yloc - 15,zloc,heading);
	end
end
