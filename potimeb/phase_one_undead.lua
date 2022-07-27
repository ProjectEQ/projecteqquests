-- NPC ID 223171
--Phase 1 - Rythor of The Undead Trial
--potimeb

local event_counter = 0;
local event_mobs = {223105,223116,223121,223122,223149,223129,223150,223152,223103,223239}

--specify trial boundaries for player check routine
local min_x = -75;
local max_x = 90;
local min_y = 1070;
local max_y = 1160;
local player_limit = 18;	

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
	eq.set_timer("Phase1Undead",45000);
	eq.set_timer("player_count",5 * 1000);	--check to ensure only 18 players in trial area
end

function event_timer(e)
	if(e.timer == "Phase1Undead") then
		-- spawn first wave of 3 an_undead_guardian
		eq.spawn2(223152,0,0,65.2,1109.7,494.8,371); --Rythor_of_the_Undead (untargetable version)
		eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,45.2,1109.7,494.8,371); 
		eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,45.2,1139.7,494.8,371);
		eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,45.2,1084.7,494.8,371);
		eq.stop_timer("Phase1Undead");
	elseif(e.timer == "player_count") then
		CheckPlayerCount(e);
	end
end

function event_signal(e)
	-- signal 1 comes from the phase 1 an_undead_guardian and is used
	-- to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn second wave consisting of 4 an_undead_guardian
		if (event_counter == 3) then			
			eq.spawn2(223103,0,0,65.2,1084.7,494.8,371);	--undead protector (untargetable)
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,22,1140,494.8,255); 
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,12,1140,494.8,255);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,22,1083,494.8,0);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,12,1083,494.8,0);
		-- spawn third wave consisting of 4 an_undead_guardian (mezzable)
		elseif (event_counter == 7) then
			eq.spawn2(223103,0,0,65.2,1139.7,494.8,371);	--undead protector (untargetable)
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,-23,1095,494.8,127):SetSpecialAbility(SpecialAbility.unmezable, 0);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,-23,1130,494.8,127):SetSpecialAbility(SpecialAbility.unmezable, 0);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,45,1095,494.8,371):SetSpecialAbility(SpecialAbility.unmezable, 0);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,45,1130,494.8,371):SetSpecialAbility(SpecialAbility.unmezable, 0);
		-- spawn boss and grunts
		elseif (event_counter == 11) then
			eq.depop_all(223103);	--despawn untargetable undead protectors
			eq.depop_all(223152);	--despawn untargetable Rythor_of_the_Undead
			eq.spawn2(223150,0,0,65.2,1139.7,494.8,371); -- an_undead_protector
			eq.spawn2(223150,0,0,65.2,1084.7,494.8,371); -- an_undead_protector

			-- Check on which version to spawn
			local expedition = eq.get_expedition()
			if (expedition.valid and not expedition:HasLockout('Rythor of the Undead')) then
				eq.unique_spawn(223129,0,0,65.2,1109.7,494.8,371); -- Rythor_of_the_Undead
			else
				eq.unique_spawn(223239,0,0,65.2,1109.7,494.8,371);		--#Shadow_of_Rythor (223239)  PH version
			end		
			-- reset event_counter for the final wave signal check
			event_counter = 0;
		end
	-- signal 2 comes from the mobs in the final wave of the undead event
	elseif (e.signal == 2) then
		event_counter = event_counter + 1;
		-- event completed
		if (event_counter == 3) then
			-- tell zone_status
			eq.signal(223097,223171); -- Add Loot Lockout for Phase 1 Wing
			eq.signal(223097,2); -- Increment Phase 1 Wing Counter
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},7,80,"Ethereal mists gather at the far wall, causing it to fade in and out of focus.");
			-- depop as my job is done.
			eq.depop();
		end
	end
end

function CheckPlayerCount(e)
	local player_list = eq.get_entity_list():GetClientList();
	local count = 0;
	if(player_list ~= nil) then
		for pc in player_list.entries do
			if pc:GetX() >= min_x and pc:GetX() <= max_x and pc:GetY() >= min_y and pc:GetY() <= max_y and not pc:GetGM() then
				count = count + 1;
				if count > player_limit then 
					pc:MovePC(219,-37,-110,13,0);	--boot to Time A
				end
			end
		end
	end
end
