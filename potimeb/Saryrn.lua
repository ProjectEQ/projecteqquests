--Saryrn (223076)
--Phase 4 Encounter
--potimeb

local event_mobs = {223083,223084,223085,223086};

function event_death_complete(e)
	eq.signal(223097,223076); -- Add Loot Lockout
	eq.signal(223097,5); -- send a signal to the zone_status that I died
end

function event_spawn(e)
	eq.set_next_hp_event(96);
end

function event_combat(e)
	if e.joined then
		eq.stop_timer("reset");
	else
		eq.set_timer("reset",5 * 60 * 1000);
	end
end

function event_timer(e)
	if e.timer == "reset" then
		eq.stop_timer("reset");
		eq.set_next_hp_event(96);
		for k,v in pairs(event_mobs) do	--depop adds
			eq.depop_all(v);
		end
	end
end

function event_hp(e)
	if (e.hp_event == 96) then
		SpawnAdds();
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		SpawnAdds();
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		SpawnAdds();
	end
end

function SpawnAdds()	--spawns 4 adds (2 sets of same type)  -- A_Mouth_of_Insanity, A_Tormentor, A_Mouth_of_Dementia, A_Twisted_Tormentor
	local id1 = event_mobs[math.random(#event_mobs)];	
	local id2 = nil;
	
	while id2 == nil do
		id2 = event_mobs[math.random(#event_mobs)];	--select 2nd add, but must be different than first selection
		if id2 == id1 then
			id2 = nil;		--reset to roll again if same mob id
		end
	end
	
	for n = 1,2 do
		mob = eq.spawn2(id1,0,0,-219,-350,348,0);
		mob:CastToNPC():MoveTo(-219,-280,348,0,true);
		mob2 = eq.spawn2(id2,0,0,-350,-230,348,127);
		mob2:CastToNPC():MoveTo(-270,-230,348,127,true);
	end
end
