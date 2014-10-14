-- 201450
-- #Event_Torture_Control
--
--
-- The trial of hanging starts 20 seconds after spiging with the appropriate Tribunal
--
-- There are 4 waves of 4 mobs.
--
-- After the 1st mob from each wave (each 4 mobs to a wave are uniquely identified) the
-- next wave timer will start; 90 seconds after the 1st mob in the wave is killed the 
-- second wave will spawn.
--
-- If a Wave of Mobs is killed in less than 60 seconds then a Wraith of Agony will spawn.
--
-- When the Wraith of Agony dies all of the NPCs within the trial will be fully healed.
--
-- If a Wraith of Agon spawns and is not aggroed within 60 seconds the Trial fails.
--
-- If the first wave of mobs is not aggroed within 5minutes of reaching its final waypoint
-- the Trial fails.
--
-- A full wave need not be completely killed before the following wave spawns.
--
-- After all of the wave of mobs has been killed and all of the Wraith of Agony mobs are killed
-- the final boss will spawn.
--
local trial_wave		= 0;

-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local wave_timer	= 90000;
local first_wave 	= 20000;

local trial_mobs	= { 201452, 201455, 201475, 201476, 201477, 201478, 201479, 201480, 201481, 201482, 201483, 201484, 201485, 201486, 201487, 201488, 201489, 201490, 201491, 201492};

local wave1 = { 201477, 201478, 201479, 201480 };
local wave2 = { 201481, 201482, 201483, 201484 };
local wave3 = { 201485, 201486, 201487, 201488 };
local wave4 = { 201489, 201490, 201491, 201492 };

local wave1_wraith = 1;
local wave2_wraith = 1;
local wave3_wraith = 1;
local wave4_wraith = 1;

local wave1_spawned = 0;
local wave2_spawned = 0;
local wave3_spawned = 0;
local wave4_spawned = 0;

local wave1_clear = 0;
local wave2_clear = 0;
local wave3_clear = 0;
local wave4_clear = 0;

function event_spawn(e)
	spawn_prisoners();

	-- Mobs should spawn ~20sec after the Event starts
	eq.set_timer("wave1", first_wave);

	trial_wave = 0;

	wave1_clear = 0;
	wave2_clear = 0;
	wave3_clear = 0;
	wave4_clear = 0;

	wave1_wraith = 1;
	wave2_wraith = 1;
	wave3_wraith = 1;
	wave4_wraith = 1;

	wave1_spawned = 0;
	wave2_spawned = 0;
	wave3_spawned = 0;
	wave4_spawned = 0;
end

function event_signal(e)
	if (e.signal == 1) then
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Success!");

		despawn_mobs();
		eq.depop();

	elseif (e.signal == 5) then
		-- 201480 an accursed tormentor - from the 1st wave of mobs has arrived at its final
		-- waypoint in the trial room;  
		--
		-- The final waypoint is set to expire after 360 seconds at this point the mobs will
		-- despawn and the trial will be unable to be completed.
		--
		eq.set_timer("has_trial_started", 300000);

	elseif (e.signal == 7) then
		-- Wraith has died; stop the timer and CH all the NPCs and PCs(?) in the trial.
		eq.stop_timer("wraith_timer");

		heal_trial();

	elseif (e.signal == 8) then
		-- Wraith has entered combat; stop the timer.
		eq.stop_timer("wraith_timer");

	elseif (e.signal == 901) then
		wave1_clear = 1;
		for k,v in pairs(wave1) do
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) ) then
				wave1_clear = 0;
			end
		end
		if ( wave2_spawned ~= 1 ) then 
			eq.set_timer("wave2", wave_timer);
		end
		if ( wave1_clear == 1 and wave1_wraith == 1 ) then
			spawn_wraith();
		end

	elseif (e.signal == 902) then 
		wave2_clear = 1;
		for k,v in pairs(wave2) do
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) ) then
				wave2_clear = 0;
			end
		end
		if ( wave3_spawned ~= 1 ) then 
			eq.set_timer("wave3", wave_timer);
		end
		if ( wave2_clear == 1 and wave2_wraith == 1 ) then
			spawn_wraith();
		end

	elseif (e.signal == 903) then 
		wave3_clear = 1;
		for k,v in pairs(wave3) do
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) ) then
				wave3_clear = 0;
			end
		end
		if ( wave4_spawned ~= 1 ) then 
			eq.set_timer("wave4", wave_timer);
		end
		if ( wave3_clear == 1 and wave3_wraith == 1 ) then
			spawn_wraith();
		end

	elseif (e.signal == 904) then 
		wave4_clear = 1;
		for k,v in pairs(wave4) do
			if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(v) ) then
				wave4_clear = 0;
			end
		end
		if ( wave4_clear == 1 and wave4_wraith == 1 ) then
			spawn_wraith();
		end
	end

	if (e.signal == 901 or e.signal == 902 or e.signal == 903 or e.signal == 904) then 

		-- A mob has been killed; stop the "has_trial_started" timer.
		eq.stop_timer("has_trial_started");

		-- If all the waves are clear ( which means all 16 of the 4x4 mobs are dead ).
		-- Set the Boss Timer to check every second; this is to ensure we don't spawn
		-- the Boss while there is a Wraith of Agony still up.
		if ( wave1_clear == 1 and wave2_clear == 1 and wave3_clear == 1 and wave4_clear == 1 ) then 
			eq.set_timer("boss_timer", 1000);
		end

	end

end

function event_timer(e)

	if (e.timer == "wave1") then
		eq.stop_timer(e.timer);
		spawn_mobs(1);

	elseif (e.timer == "wave2") then
		eq.stop_timer(e.timer);
		spawn_mobs(2);
		
	elseif (e.timer == "wave3") then
		eq.stop_timer(e.timer);
		spawn_mobs(3);

	elseif (e.timer == "wave4") then
		eq.stop_timer(e.timer);
		spawn_mobs(4);

	elseif (e.timer == "boss_timer") then

		-- If all the Wraiths are dead; spawn the Boss
		if ( not eq.get_entity_list():IsMobSpawnedByNpcTypeID(201452) ) then
			eq.stop_timer("boss_timer");
			eq.spawn2(201455, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
		end

	elseif (e.timer == "wraith_timer" or e.timer == "has_trial_started") then 
		-- Event Failed
		eq.stop_timer(e.timer);
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "You have been found unworthy and have failed, you should be shamed and publicly flogged.");

		-- Tell the Tribunal we failed
		eq.signal(201438, 2);

		despawn_prisoners();
		eq.depop();

	elseif (e.timer == "wave1_timer") then
		eq.stop_timer(e.timer);
		wave1_wraith = 0;
	elseif (e.timer == "wave2_timer") then
		eq.stop_timer(e.timer);
		wave2_wraith = 0;
	elseif (e.timer == "wave3_timer") then
		eq.stop_timer(e.timer);
		wave3_wraith = 0;
	elseif (e.timer == "wave4_timer") then
		eq.stop_timer(e.timer);
		wave4_wraith = 0;
	end
end

function spawn_wraith()
	local location = eq.ChooseRandom(1,2);

	if ( location == 1 ) then
		eq.spawn2(201452, 51, 0, 723, -1120, 88, 68);
	else 
		eq.spawn2(201452, 0, 0, 915, -1120, 58, 194);
	end
	eq.set_timer("wraith_timer", 60000);
end

function spawn_mobs(wave)
	-- Wave 1 = 201477, 201478, 201479, 201480
	-- Wave 2 = 201481, 201482, 201483, 201484
	-- Wave 3 = 201485, 201486, 201487, 201488
	-- Wave 4 = 201489, 201490, 201491, 201492

	-- if the mob is killed in less than 90 seconds, spawn a Wraith of Agony
	eq.set_timer("wave" .. wave .. "_timer", 90000);

	local mob1 = 201473 + (4 * wave);

	-- South Spawns
	eq.spawn2(mob1    , 49,0,857,-1220,73,255 );
	eq.spawn2((mob1+1), 49,0,882,-1220,73,255 );

	-- North Spawns
	eq.spawn2((mob1+2), 50,0,857,-1015,73, 130 );
	eq.spawn2((mob1+3), 50,0,882,-1015,73, 130 );
	
	if (wave == 1) then
		wave1_spawned = 1;
	elseif (wave == 2) then 
		wave2_spawned = 1;
	elseif (wave == 3) then
		wave3_spawned = 1;
	elseif (wave == 4) then 
		wave4_spawned = 1;
	end

end

function spawn_prisoners()
	-- a tortured prisoner
	eq.spawn2(201476, 0, 0, 907, -1157, 58, 222);
	eq.spawn2(201476, 0, 0, 831, -1157, 58, 31);
	eq.spawn2(201476, 0, 0, 831, -1084, 58, 90);
	eq.spawn2(201476, 0, 0, 906, -1084, 58, 156);

	-- Pain and Suffering
	eq.spawn2(201475, 0,0, 912,-1161, 60, 222);
	eq.spawn2(201475, 0,0, 824,-1161, 60, 35);
	eq.spawn2(201475, 0,0, 824,-1078, 60, 90);
	eq.spawn2(201475, 0,0, 910,-1078, 60, 162);
end

function despawn_prisoners() 
	local prisoners = { 201476, 201475 }
	for k,v in pairs(prisoners) do
		eq.depop_all(v);
	end
end

function despawn_mobs()
	for k,v in pairs(trial_mobs) do
		eq.depop_all(v);
	end
end

function heal_trial()
	local entity_list = eq.get_entity_list();

	for k,v in pairs(trial_mobs) do
		-- If the NPC is not the Pain and Suffering Mob (no need to heal that one).
		if (v ~= 201475) then 
			local npc = eq.get_entity_list():GetMobByNpcTypeID(v);
			if (npc.valid) then 
				--(772, -1148, 76, 175)
				if ( npc:CalculateDistance(772, -1148, 76) < 175) then
					npc:SetHP(npc:GetMaxHP());
					npc:Emote("shivers as their wounds fade.");
				end
			end
		end
	end
end
