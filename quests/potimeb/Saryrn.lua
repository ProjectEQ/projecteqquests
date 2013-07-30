function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	if (e.hp_event == 91) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348.0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348.0);
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348.0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348.0);
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		-- spawn Saryrn's 4 random mobs from A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348.0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-219,-350,348,0);
		eq.spawn2(eq.ChooseRandom(223083,223084,223085,223086),0,0,-350,-230,348.0);
	end
end