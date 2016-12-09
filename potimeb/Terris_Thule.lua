function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 1
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,1)),7,"H13");
end

function event_combat(e)
	if (e.joined == false) then
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(91);
	end
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	if (e.hp_event == 91) then
		-- spawn Terris 4 random mobs from  A_Summoned_Guardian_of_Terris,
		-- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,344,348,128);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,277,348,128);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-347,210,348,64);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-296,210,348,64);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn Terris 4 random mobs from  A_Summoned_Guardian_of_Terris,
		-- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,344,348,128);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,277,348,128);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-347,210,348,64);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-296,210,348,64);
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		-- spawn Terris 4 random mobs from  A_Summoned_Guardian_of_Terris,
		-- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,344,348,128);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,277,348,128);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-347,210,348,64);
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-296,210,348,64);
	end
end
