--#Innoruuk (223167)
--Phase 5 God
--potimeb

local event_mobs = {223231,223232};

function event_spawn(e)
	eq.set_next_hp_event(75);
end

function event_hp(e)
	if (e.hp_event == 75) then
		SpawnAdds(3,4);
		eq.set_next_hp_event(20);
	elseif (e.hp_event == 20) then
		SpawnAdds(4,5);
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
		eq.set_next_hp_event(75);
		for k,v in pairs(event_mobs) do
			eq.depop_all(v);
		end
	end
end

function SpawnAdds(min_adds,max_adds)	--spawns 4 adds (2 sets of same type)	
	local rand = math.random(min_adds,max_adds);
	eq.spawn2(223231,0,0,210,315,5,257);	--guardian of the dark prince
	eq.spawn2(223232,0,0,300,215,5,387);	--Hatebringer of Innoruuk
	
	if (rand >= 3) then eq.spawn2(223231,0,0,280,330,15,324); end
	if (rand >= 4) then eq.spawn2(223232,0,0,325,280,15,324); end
	if (rand == 5) then eq.spawn2(eq.ChooseRandom(223231,223232),0,0,255,255,5,324); end
end

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,223167); -- Add Lockout
	eq.signal(223097,6);
end