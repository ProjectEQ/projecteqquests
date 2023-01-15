-- NPCID 223173
--Phase 1 - Kazrok of Fire Trial
--potimeb

local event_counter = 0;
local event_mobs = {223088,223089,223128,223095,223234,223235,223236,223237,223090,223094,223163};

--specify trial boundaries for player check routine
local min_x = -75;
local max_x = 90;
local min_y = 505;
local max_y = 635;
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
	eq.set_timer("Phase1Fire",45000);
	eq.set_timer("player_count",5 * 1000);	--check to ensure only 18 players in trial area
end

function event_timer(e)
	if(e.timer == "Phase1Fire") then
		-- spawn first wave of 3 #a_flame_mephit
		eq.spawn2(eq.ChooseRandom(223088,223089),0,0,45,573,504,371);
		eq.spawn2(eq.ChooseRandom(223088,223089),0,0,68,553,504,371);
		eq.spawn2(eq.ChooseRandom(223088,223089),0,0,68,593,504,371);
		eq.unique_spawn(223128,0,0,68,573,504,371);	--Kazrok_of_Fire (223128)  untargetable version
		eq.stop_timer("Phase1Fire");
	end
end


function event_signal(e)
	-- signal 1 comes from the phase 1 an_inferno_mephit
	-- and is used to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn Kazrok_of_Fire
		if (event_counter == 6) then
			eq.depop(223128);

			-- Check on which version to spawn
			local expedition = eq.get_expedition()
			if (expedition.valid and not expedition:HasLockout('Kazrok of Firer')) then
				eq.unique_spawn(223090,0,0,68,573,504,371);  	--#Kazrok_of_Fire (223090)
			else
				eq.unique_spawn(223244,0,0,68,573,504,371);	--#Shadow_of_Kazrok (223244)  PH version
			end
			event_counter = 0;
		end
	-- signal 2 comes from Kazrok_of_Fire,an_inferno_mephit_, and a_flame_mephit_
	elseif (e.signal == 2) then
		event_counter = event_counter + 1;
		if (event_counter == 7) then
			-- tell zone_status
			eq.signal(223097,223173); -- Add Loot Lockout for Phase 1 Wing
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
