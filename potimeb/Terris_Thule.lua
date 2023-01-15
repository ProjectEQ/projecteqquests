--Terris_Thule (223075)
--Phase 4 Encounter
--potimeb

local event_mobs = {223079,223081,223080,223082};

function event_death_complete(e)
	eq.signal(223097,223075); -- Add Loot Lockout
	eq.signal(223097,5); -- send a signal to the zone_status that I died
end

function event_spawn(e)
	eq.set_next_hp_event(91);
end

function event_hp(e)
	if (e.hp_event == 91) then
		SpawnAdds();
		eq.set_next_hp_event(51);
	elseif (e.hp_event == 51) then
		SpawnAdds();
		eq.set_next_hp_event(11);
	elseif (e.hp_event == 11) then
		SpawnAdds();
	end
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
		eq.set_next_hp_event(91);
		for k,v in pairs(event_mobs) do	--depop adds
			eq.depop_all(v);
		end
	end
end

function SpawnAdds()	--spawns 4 adds (2 sets of same type)  -- A_Summoned_Knight_of_Terris,A_Phantasm_of_Terris,A_Nightmare_Knight_of_Terris
	local id1 = event_mobs[math.random(#event_mobs)];	
	local id2 = nil;
	
	while id2 == nil do
		id2 = event_mobs[math.random(#event_mobs)];	--select 2nd add, but must be different than first selection
		if id2 == id1 then
			id2 = nil;		--reset to roll again if same mob id
		end
	end
	
	for n = 1,2 do
		mob = eq.spawn2(id1,0,0,-219,344,348,256);
		mob:CastToNPC():MoveTo(-219,250,348,256,true);
		mob2 = eq.spawn2(id2,0,0,-347,210,348,128);
		mob2:CastToNPC():MoveTo(-260,210,348,128,true);
	end
end
