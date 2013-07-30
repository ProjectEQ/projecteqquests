-- NPCID 223173
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
	eq.set_timer("Phase1Fire",45000);
end

function event_timer(e)
	if(e.timer == "Phase1Fire") then
		-- spawn first wave of 3 #a_flame_mephit
	    eq.spawn2(223088,0,0,68,573,504,185.5);
		eq.spawn2(223088,0,0,68,563,504,185.5);
		eq.spawn2(223088,0,0,68,583,504,185.5);
		eq.stop_timer("Phase1Fire");
	end
end


function event_signal(e)
	-- signal 1 comes from the phase 1 #a_flame_mephit, a_flame_mephit, & an_inferno_mephit
	-- and is used to increment a counter so we know when to spawn the next wave.
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		-- spawn Kazrok_of_Fire
		if (event_counter == 9) then
			eq.spawn2(223090,0,0,68,573,504,185.5); 
			event_counter = 0;
		end
	-- signal 2 comes from Kazrok_of_Fire,an_inferno_mephit_, and a_flame_mephit_
	elseif (e.signal ==2) then
		event_counter = event_counter + 1;
		if (event_counter == 7) then
			-- tell zone_status
			eq.signal(223097,2);
			-- depop as my job is done.
			eq.depop();
		end
	end
end
