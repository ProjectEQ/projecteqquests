-- NPCID 223169
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
	eq.set_timer("Phase1Earth",45000);
end

function event_timer(e)
	if(e.timer == "Phase1Earth") then
		-- spawn first wave of 3 a_pile_of_living_rubble
		eq.spawn2(223106,0,0,70.3,1644.5,493.7,185.5);
		eq.spawn2(223106,0,0,70.3,1654.5,493.7,185.5);
		eq.spawn2(223106,0,0,70.3,1634.5,493.7,185.5);
		eq.stop_timer("Phase1Earth");
	end
end

function event_signal(e)
	-- signal 1 comes from the phase 1 a_pile_of_living_rubble and a_rock_shaped_assassin
	-- and is used to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn Terlok_of_Earth
		if (event_counter == 9) then
			eq.spawn2(223119,0,0,70.3,1644.5,493.7,185.5); 
			event_counter = 0;
		end
	-- signal 2 comes from Terlok_of_Earth
	elseif (e.signal ==2) then
		-- tell zone_status
		eq.signal(223097,2);
		local entity_list = eq.get_entity_list();
		-- unlock the phase 1 earth clock door (4 pieces)
		for i = 9, 12, 1 do
			entity_list:FindDoor(i):SetLockPick(0);
		end
		-- depop as my job is done.
		eq.depop();
	end
end