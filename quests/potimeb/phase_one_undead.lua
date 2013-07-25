-- NPC ID 223171
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
	-- wait 45 seconds before spawning the mobs.
	eq.clear_proximity();
	eq.set_timer("Phase1Undead",45000);
end

function event_timer(e)
	if(e.timer == "Phase1Undead") then
		-- spawn first wave of 3 an_undead_guardian
		eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,65.2,1109.7,494.8,185.5); 
		eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,65.2,1119.7,494.8,185.5);
		eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,65.2,1099.7,494.8,185.5);
		eq.stop_timer("Phase1Undead");
	end
end

function event_signal(e)
	-- signal 1 comes from the phase 1 an_undead_guardian and is used
	-- to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn second wave consisting of 4 an_undead_guardian
		if (event_counter == 3) then
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,67,1103,494.8,185.5); 
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,67,1120,494.8,185.5);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,62,1103,494.8,185.5);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121),0,0,62,1120,494.8,185.5);
		-- spawn third wave consisting of 4 an_undead_guardian
		elseif (event_counter == 7) then
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,67,1103,494.8,185.5); 
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,67,1120,494.8,185.5);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,62,1103,494.8,185.5);
			eq.spawn2(eq.ChooseRandom(223105,223116,223121,223122,223149),0,0,62,1120,494.8,185.5);
		-- spawn boss and grunts
		elseif (event_counter == 11) then
			eq.spawn2(223129,0,0,65.2,1109.7,494.8,185.5); -- Rythor_of_the_Undead
			eq.spawn2(223150,0,0,65.2,1119.7,494.8,185.5); -- an_undead_protector
			eq.spawn2(223150,0,0,65.2,1099.7,494.8,185.5); -- an_undead_protector
			-- reset event_counter for the final wave signal check
			event_counter = 0;
		end
	-- signal 2 comes from the mobs in the final wave of the undead event
	elseif (e.signal == 2) then
		event_counter = event_counter + 1;
		-- event completed
		if (event_counter == 3) then
			-- tell zone_status
			eq.signal(223097,2);
			local entity_list = eq.get_entity_list();
			-- unlock the phase 1 undead clock door (4 pieces)
			for i = 29, 32, 1 do
				entity_list:FindDoor(i):SetLockPick(0);
			end
			-- depop as my job is done.
			eq.depop();
		end
	end
end