function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 1
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,1)),7,"H13");
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("OOBcheck", 6 * 1000);
		eq.stop_timer('reset');
	else
		eq.stop_timer("OOBcheck");
		eq.set_timer('reset', 6 * 1000);
	end
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	if (e.hp_event == 91) then
		-- spawn Terris 4 random mobs from  A_Summoned_Guardian_of_Terris,
		-- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,344,348,256); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,277,348,256); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-347,210,348,128); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-296,210,348,128); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.set_timer('terrishelp', 1 * 1000);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn Terris 4 random mobs from  A_Summoned_Guardian_of_Terris,
		-- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,344,348,256); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,277,348,256); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-347,210,348,128); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-296,210,348,128); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.set_timer('terrishelp', 1 * 1000);
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		-- spawn Terris 4 random mobs from  A_Summoned_Guardian_of_Terris,
		-- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,344,348,256); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-219,277,348,256); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-347,210,348,128); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.spawn2(eq.ChooseRandom(223079,223081,223080,223082),0,0,-296,210,348,128); -- NPC(s): A_Summoned_Guardian_of_Terris (223079), A_Summoned_Knight_of_Terris (223081), A_Phantasm_of_Terris (223080), A_Nightmare_Knight_of_Terris (223082)
		eq.set_timer('terrishelp', 1 * 1000);
	end
end

function event_timer(e)
	if(e.timer == 'terrishelp') then
		help_terris(e);
		eq.stop_timer('terrishelp');
	elseif(e.timer == 'reset') then
		e.self:SetHP(e.self:GetMaxHP());
		eq.set_next_hp_event(91);
		eq.depop_all(223079); -- depop adds
		eq.depop_all(223080);
		eq.depop_all(223081);
		eq.depop_all(223082);
		eq.stop_timer('reset');
	elseif(e.timer=="OOBcheck") then
		eq.stop_timer("OOBcheck");
			if (e.self:GetX() > -183 or e.self:GetY() < 178) then
				e.self:GotoBind();
				e.self:WipeHateList();
				e.self:CastSpell(3230,e.self:GetID()); -- Spell: Balance of the Nameless
			else
				eq.set_timer("OOBcheck", 6 * 1000);
			end
	end
end

function help_terris(e)
	local npc_list =  eq.get_entity_list():GetNPCList();
	for npc in npc_list.entries do
		if (npc.valid and (npc:GetNPCTypeID() == 223079 or npc:GetNPCTypeID() == 223080 or npc:GetNPCTypeID() == 223081 or npc:GetNPCTypeID() == 223082)) then
		npc:CastToNPC():MoveTo(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0, false);
		end
	end		
end
