--NPC ID 223170
--Phase 1 - Neimon of Air Trial
--potimeb

local event_counter = 0;
local event_mobs = {223087,223226,223111,223120,223240,223241}; 

--specify trial boundaries for player check routine
local min_x = -75;
local max_x = 90;
local min_y = 1290;
local max_y = 1415;
local player_limit = 18;	

function event_spawn(e)
	event_counter = 0;
	-- create a proximity to set the spawn timer
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 80, xloc + 80, yloc - 60, yloc + 60);
end

function event_enter(e)
	-- tell zone_status phase 1 was started
	eq.signal(223097,1,5*1000);
	-- wait 45 seconds before spawning the mobs.
	eq.clear_proximity();
	eq.set_timer("Phase1Air",45000);
	eq.set_timer("player_count",5 * 1000);	--check to ensure only 18 players in trial area
end

function event_timer(e)
	if(e.timer == "Phase1Air") then
		-- spawn first wave of 4 An_Air_Phoenix_Noble
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0,-50,1330,494.8,59);
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0,-50,1385,494.8,189);
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0, 0,1330,494.8,458);
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0, 0,1385,494.8,320);
		eq.stop_timer("Phase1Air");
	elseif(e.timer == "player_count") then
		CheckPlayerCount(e);
	end
end

function event_signal(e)
	-- signal 1 comes from the phase 1 An_Air_Phoenix_Noble and is used
	-- to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		--spawn untargetable birds as event progresses
		if event_counter == 1 then
			eq.spawn2(223241,0,0,68,1315,494.8,371); --  #Servitor_of_Xegony (223241)
		elseif event_counter == 2 then
			eq.spawn2(223241,0,0,68,1335,494.8,371); --  #Servitor_of_Xegony (223241)
		elseif event_counter == 3 then
			eq.spawn2(223241,0,0,68,1375,494.8,371); -- #Servitor_of_Xegony (223241)		
		elseif (event_counter == 4) then
			-- spawn targetable second wave with Boss
			eq.depop_all(223241);
			mob1 = eq.spawn2(223111,0,0,68,1375,494.8,371); -- Servitor_of_Xegony
			mob2 = eq.spawn2(223111,0,0,68,1395,494.8,371); -- Servitor_of_Xegony
			mob3 = eq.spawn2(223111,0,0,68,1335,494.8,371); -- Servitor_of_Xegony
			mob4 = eq.spawn2(223111,0,0,68,1315,494.8,371); -- Servitor_of_Xegony
			
			--flag 2 out of 4 mobs as mezzable at random
			if math.random(100) <= 50 then
				mob1:SetSpecialAbility(SpecialAbility.unmezable, 0);	
			else
				mob2:SetSpecialAbility(SpecialAbility.unmezable, 0);	
			end
			
			if math.random(100) <= 50 then
				mob3:SetSpecialAbility(SpecialAbility.unmezable, 0);	
			else
				mob4:SetSpecialAbility(SpecialAbility.unmezable, 0);	
			end			
				
			
			event_counter = 0;

			-- Check on which version to spawn
			local expedition = eq.get_expedition()
			if (expedition.valid and not expedition:HasLockout('Neimon of Air')) then
				eq.spawn2(223120,0,0,68,1355,494.8,371); -- Neimon_of_Air
			else
				eq.spawn2(223240,0,0,68,1355,494.8,371);	--#Shadow_of_Neimon (223240)
			end
			
		end
	-- signal 2 comes from the mobs in the final wave of the air event
	elseif (e.signal ==2) then
		event_counter = event_counter + 1;
		if (event_counter == 5) then
			-- tell zone_status
			eq.signal(223097,223170); -- Add Loot Lockout for Phase 1 Wing
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