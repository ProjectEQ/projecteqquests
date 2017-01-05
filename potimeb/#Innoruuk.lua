function event_combat(e)
	if (e.joined == true) then
		eq.set_next_hp_event(80);
	end
end

function event_hp(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	local zloc = e.self:GetZ();
	local heading = e.self:GetHeading();
	if(e.hp_event == 80) then
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
		eq.spawn2(eq.ChooseRandom(223231,223232),0,0,xloc,yloc,zloc,heading);
	end
end

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,6);
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 4
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,4)),7,"H13");
end
