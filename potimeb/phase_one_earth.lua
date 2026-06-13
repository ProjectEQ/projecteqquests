-- NPCID 223169
--Phase 1 - Terlok of Earth Trial
--potimeb

local event_counter = 0;
local terlok = false;

function event_spawn(e)
	-- create a proximity to set the spawn timer
	event_counter = 0;
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 80, xloc + 80, yloc - 60, yloc + 60);
end

function event_enter(e)
	-- tell zone_status phase 1 was started
	eq.signal(223097,1,5*1000);
	-- wait 45 seconds before spawning the mobs.
	eq.clear_proximity();
	eq.set_timer("Phase1Earth",45000);
end

function event_timer(e)
	if(e.timer == "Phase1Earth") then
		-- spawn first wave of 3 a_pile_of_living_rubble
		eq.spawn2(223106,0,0,70.3,1644.5,493.7,371);
		eq.spawn2(223106,0,0,70.3,1664.5,493.7,371);
		eq.spawn2(223106,0,0,70.3,1624.5,493.7,371);
		eq.stop_timer("Phase1Earth");
	end
end

function event_signal(e)
	-- signal 1 comes from the phase 1 a_rock_shaped_assassin
	-- and is used to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn Terlok_of_Earth
		if (event_counter == 6) then

			-- Check on which version to spawn
			local expedition = eq.get_expedition()
			if (expedition.valid and not expedition:HasLockout('Terlok of Earth')) then
				eq.unique_spawn(223119,0,0,70.3,1644.5,493.7,371); 	--Terlok_of_Earth (223119)
			else
				eq.unique_spawn(223238,0,0,70.3,1644.5,493.7,371);		--#Shadow_of_Terlok (223238)  PH version
			end
			--event_counter = 0;
		end
	-- signal 2 comes from Terlok_of_Earth
	elseif (e.signal == 2) then
		terlok = true;
	end
	TrialWinCheck(e);
end

function TrialWinCheck(e)	--to make successful end event once both boss and adds are dead
	if terlok and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223147) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(223106) then	
		-- tell zone_status
		eq.signal(223097,223169); -- Add Loot Lockout for Phase 1 Wing
		eq.signal(223097,2); -- Increment Phase 1 Wing Counter
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},MT.LightGray,80,"Ethereal mists gather at the far wall, causing it to fade in and out of focus.");

		-- depop as my job is done.
		eq.depop();
	end
end
			