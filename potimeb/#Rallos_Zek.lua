function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6);
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 8
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,8)),7,"H13");
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	e.self:Emote("Rallos Zek roars a mighty war cry and swings his axe in vengeance.");
	if (e.hp_event == 91) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 25,zloc,heading);
		eq.set_next_hp_event(76);
	elseif (e.hp_event == 76) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 25,zloc,heading);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 25,zloc,heading);
		eq.set_next_hp_event(26);
	elseif (e.hp_event == 26) then
		-- spawn a_summoned_boar and a_summoned_minion
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 15,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc + 25,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223229,223230),0,0,xloc,yloc - 25,zloc,heading);
	end
end