-- NPC ID 223170
local event_counter = 0;

function event_spawn(e)
	-- create a proximty to set the spawn timer
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 80, xloc + 80, yloc - 60, yloc + 60);
end

function event_enter(e)
	-- tell zone_status phase 1 was started
	eq.signal(223097,1);
	-- wait 60 seconds before spawning the mobs.
	eq.clear_proximity();
	eq.set_timer("Phase1Air",6000);
end

function event_timer(e)
	if(e.timer == "Phase1Air") then
		-- spawn first wave of 4 An_Air_Phoenix_Noble
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0,67,1364,494.8,185.5);
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0,67,1347,494.8,185.5);
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0,62,1364,494.8,185.5);
		eq.spawn2(eq.ChooseRandom(223087,223226),0,0,62,1347,494.8,185.5);
		eq.stop_timer("Phase1Air");
	end
end

function event_signal(e)
	-- signal 1 comes from the phase 1 An_Air_Phoenix_Noble and is used
	-- to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn second wave
		if (event_counter == 4) then
			eq.spawn2(223120,0,0,68,1355,494.8,185.5); -- Neimon_of_Air
			eq.spawn2(223111,0,0,68,1365,494.8,185.5); -- Servitor_of_Xegony
			eq.spawn2(223111,0,0,68,1375,494.8,185.5); -- Servitor_of_Xegony
			eq.spawn2(223111,0,0,68,1345,494.8,185.5); -- Servitor_of_Xegony
			eq.spawn2(223111,0,0,68,1335,494.8,185.5); -- Servitor_of_Xegony
			event_counter = 0;
		end
	-- signal 2 comes from the mobs in the final wave of the air event
	elseif (e.signal ==2) then
		event_counter = event_counter + 1;
		if (event_counter == 5) then
			-- tell zone_status
			eq.signal(223097,2);
			local entity_list = eq.get_entity_list();
			-- unlock the phase 1 air clock door (4 pieces)
			for i = 1, 4, 1 do
				entity_list:FindDoor(i):SetLockPick(0);
			end
			-- depop as my job is done.
			eq.depop();
		end
	end
end