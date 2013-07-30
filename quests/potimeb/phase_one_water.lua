-- NPCID 223172
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
	eq.set_timer("Phase1Water",45000);
end

function event_timer(e)
	if(e.timer == "Phase1Water") then
		-- spawn first wave of 2 a_triloun_gatherer and Anar_of_Water
		eq.spawn2(223104,0,0,68,867,495,185.5);
		eq.spawn2(eq.ChooseRandom(223092,223093),0,0,68,877,495,185.5);
		eq.spawn2(eq.ChooseRandom(223092,223093),0,0,68,857,495,185.5);
		eq.stop_timer("Phase1Water");
	end
end


function event_signal(e)
	-- signal 1 comes from the phase 1 mobs and is used to increment a
	-- counter so we know when to signal the win
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- win on a 7 count
		if (event_counter == 7) then
			-- tell zone_status
			eq.signal(223097,2);
			-- depop as my job is done.
			eq.depop();
		end
	end
end