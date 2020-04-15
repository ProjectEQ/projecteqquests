-- 201451 #Event_Stoning_Control 
-- Stoning Controller
--
--
local trial_wave     = 0;
local mobs_killed		= 0;

-- Time from when the 1st mob in a wave is killed till 
-- the next wave spawns; ~90 seconds
local first_wave     = 20000;
local next_wave		= 90000;

local trial_mobs		= { 201493, 201494, 201495, 201496, 201497, 201498, 201499 };

local wave_ids			= { };

function event_spawn(e)
   spawn_prisoners();

   -- Mobs should spawn ~20sec after the Event starts
   eq.set_timer("next_wave", first_wave);

   trial_wave	= 0;
	mobs_killed = 0;
	wave_ids		= { };
	mobs_killed = 0;
end

function event_signal(e)
   if (e.signal == 1) then
		eq.get_entity_list():MessageClose(e.self, false, 120, 3, "Success!");

      eq.signal(201437, 1); -- NPC: The_Tribunal Stoning Trial

      despawn_mobs();
      eq.depop();

   elseif (e.signal == 2) then
      -- Failed
      eq.get_entity_list():MessageClose(e.self, false, 120,3, "An unnatural silence falls around you.  The justice of the Tribunal has been pronounced once again.  The defendants have been found... lacking.");

      despawn_prisoners();
      eq.signal(201437, 2); -- NPC: The_Tribunal Stoning Trial

      eq.depop();

   elseif (e.signal == 9) then 
		local npc;
		local despawn_archers = 1;

		mobs_killed = mobs_killed + 1;

		for k,v in pairs(wave_ids) do
			npc = eq.get_entity_list():GetNPCByID(v);
			if (npc.valid) then
				despawn_archers = 0;
			end
		end

		if ( despawn_archers == 1 ) then
			eq.depop_all( 201494 );
		end

		if ( mobs_killed == 16 ) then 
			eq.spawn2(201498, 0,0, -122, -1134, 74, 508); -- NPC: Yurae_Zhaleem
		end
   end

end

function event_timer(e)

   if (e.timer == "next_wave") then
      eq.stop_timer(e.timer);

      trial_wave = trial_wave + 1;
      spawn_mobs(trial_wave);

		if ( trial_wave < 4 ) then
			eq.set_timer("next_wave", next_wave);
		end
	end
end

function spawn_mobs(wave)

	local index = table.getn(wave_ids);
	local npc;
	
	-- Spawn Archers
	if ( eq.get_entity_list():IsMobSpawnedByNpcTypeID(201494) == false ) then 
		eq.spawn2( 201494, 0, 0, -177, -1188, 73, 2); -- NPC: a_pitiless_avenger
		eq.spawn2( 201494, 0, 0,  -82, -1188, 73, 2); -- NPC: a_pitiless_avenger
	end

   if (wave < 5) then
		--
		-- Spawn 4 random mobs in 3 random cubbies
		for i = 1, 4, 1 do
			local spawn_at = eq.ChooseRandom( 1, 2, 3 );

			if (spawn_at == 1) then
				npc = eq.spawn2( eq.ChooseRandom( 201495, 201496, 201497, 201499 ), 52, 0, -130, -1233, 73, 0);
			elseif (spawn_at == 2) then
				npc = eq.spawn2( eq.ChooseRandom( 201495, 201496, 201497, 201499 ), 53, 0, -241, -1120, 73, 128);
			elseif (spawn_at == 3) then
				npc = eq.spawn2( eq.ChooseRandom( 201495, 201496, 201497, 201499 ), 54, 0, -21,  -1121, 73, 380);
			end
			if (npc.valid) then 
				wave_ids[index + i] = npc:GetID();
			end
		end
   end
end

function spawn_prisoners()
   -- an accursed prisoner
   eq.spawn2(201493, 0, 0, -88, -1046, 73, 250); -- NPC: an_accused_prisoner
   eq.spawn2(201493, 0, 0, -129, -1046, 73, 250); -- NPC: an_accused_prisoner
   eq.spawn2(201493, 0, 0, -171, -1046, 73, 250); -- NPC: an_accused_prisoner
end

function despawn_prisoners() 
   local prisoners = { 201493, 201494 }
   for k,v in pairs(prisoners) do
      eq.depop_all(v);
   end
end

function despawn_mobs()
   for k,v in pairs(trial_mobs) do
      eq.depop_all(v);
   end
end


