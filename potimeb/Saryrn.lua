function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5); -- NPC: zone_status
	-- get the zone instance id
	local instance_id = eq.get_zone_instance_id();
	-- load qglobals and set bit 2
	local qglobals = eq.get_qglobals();
	local phase_bit = tonumber(qglobals[instance_id.."_potimeb_phase_bit"]);
	eq.set_global(instance_id.."_potimeb_phase_bit",tostring(bit.bor(phase_bit,2)),7,"H13");
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
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348,0); -- NPC(s): A_Mouth_of_Insanity (223083), A_Mouth_of_Dementia (223084), A_Tormentor (223085), A_Twisted_Tormentor (223086)
	end
end
