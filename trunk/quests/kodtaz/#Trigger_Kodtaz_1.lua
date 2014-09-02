function event_spawn(e)
	-- Make sure we start fresh
	respawn_event();
end

function event_signal(e)
	-- Set a 35min Timer, if the event is idle for 35 minutes 
	-- without a signal the event will refresh.
	eq.set_timer("depop", 2100000);

	if (e.signal == 0) then
		-- Signal from Priest Summoners saying it died
		-- Check to see if all the Pixt Priest Summoner's are dead;
		-- if they are; Depop the High Summoner and Pop the next High Summoner.

		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(293213) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(293120) == false ) then
			-- Depop the first Pixt High Summoner
			eq.depop(293211);

			-- Spawn the Pixtt Grand Summoner
			eq.spawn2(293212, 0, 0, 591, 746, -460, 75);

			-- Spawn Deranged Lesser Stoneservants
			eq.spawn2(293215,0,0,611,683,-460,32);
			eq.spawn2(293215,0,0,589,771,-459,88);
			eq.spawn2(293215,0,0,673,821,-460,133);
			eq.spawn2(293215,0,0,750,754,-460,180);
			eq.spawn2(293215,0,0,705,668,-453,234);

			-- Spawn Deranged Greater Stoneservants
			eq.spawn2(293216,0,0,581,723,-460,59);
			eq.spawn2(293216,0,0,617,806,-449,103);
			eq.spawn2(293216,0,0,720,803,-460,150);
			eq.spawn2(293216,0,0,744,707,-460,207);
			eq.spawn2(293216,0,0,644,654,-460,7);
		end
	elseif (e.signal == 1) then
		-- Signal from Grand Summoner saying he died
		-- Spawn the Deranged Supreme Stoneservants
		eq.spawn2(293217,0,0,611,683,-460,32);
		eq.spawn2(293217,0,0,589,771,-459,88);
		eq.spawn2(293217,0,0,673,821,-460,133);
		eq.spawn2(293217,0,0,750,754,-460,180);
		eq.spawn2(293217,0,0,705,668,-453,234);
		eq.depop_with_timer();

	elseif (e.signal == 2) then
		-- If all the Deranged Lesser Summoners are dead - spawn the Hexxt Chaos Provoker
		if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(293215) == false ) then
			eq.spawn2(293214,0,0,684,719,-460,225);   
		end

	elseif (e.signal == 3) then
		-- Hexxt Provoker died
		-- Spawn final version of Grand Summoner that is killable
		eq.depop(293212);
		eq.spawn2(293113,0,0,591,746,-460,75);

	end
end

function event_timer(e)
	respawn_event();
end

function respawn_event(e)
	-- Reset the Event Mobs
	eq.depop_all(293211); -- Pixtt High Summoner
	eq.depop_all(293212); -- Pixtt Grand Summoner
	eq.depop_all(293113); -- Pixtt Grand Summoner
	eq.depop_all(293120); -- Pixtt Priest Summoner
	eq.depop_all(293213); -- Pixtt Priest Summoner
	
	eq.depop_all(293214); -- Hextt Chaos Provoker
	eq.depop_all(293215); -- Deranged Lesser Stoneservant
	eq.depop_all(293216); -- Deranged Greater Stoneservant
	eq.depop_all(293217); -- Deranged Supreme Stoneservant
	eq.depop_all(293219); -- Rav Priest Guardian
	
	-- Spawn 293213 Pixtt Priest Summoners
	eq.spawn2(293213, 0, 0, 613, 789, -450, 94);
	eq.spawn2(293213, 0, 0, 692, 810, -456, 172);
	eq.spawn2(293213, 0, 0, 725, 770, -460, 162);
	eq.spawn2(293213, 0, 0, 717, 690, -449, 240);
	eq.spawn2(293213, 0, 0, 596, 703, -456, 44);

	-- Spawn 293120 ##Pixtt Priest Summoner
	eq.spawn2(293120, 0, 0, 651, 815, -460, 113);
	eq.spawn2(293120, 0, 0, 740, 723, -456, 220);
	eq.spawn2(293120, 0, 0, 677, 669, -451, 244);
	eq.spawn2(293120, 0, 0, 623, 672, -460, 14);

	-- Spawn 293211 Pixtt High Summoner
	eq.spawn2(293211, 0, 0, 591, 746, -460, 75);
end