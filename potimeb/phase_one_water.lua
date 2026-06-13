-- NPCID 223172
--Phase 1 - Anar of Water Trial
--potimeb

local event_counter = 0;
local event_mobs = {223092,223093,223104,223091,223100,223115};

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
	eq.set_timer("Phase1Water",45000);
end

function event_timer(e)
	if(e.timer == "Phase1Water") then
		-- spawn first wave of 2 a_triloun_gatherer 
		eq.spawn2(eq.ChooseRandom(223092,223093),0,0,48,892,495,371);
		eq.spawn2(eq.ChooseRandom(223092,223093),0,0,48,842,495,371);

		-- Check on which version to spawn
		local expedition = eq.get_expedition()
		if (expedition.valid and not expedition:HasLockout('Anar of Water')) then
			eq.spawn2(223104,0,0,68,867,495,371);	--Anar_of_Water (223104)
		else
			eq.spawn2(223091,0,0,68,867,495,371);	--#Shadow_of_Anar (223091)
		end
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
			eq.signal(223097,223172); -- Add Loot Lockout for Phase 1 Wing
			eq.signal(223097,2); -- Increment Phase 1 Wing Counter
			eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()},MT.LightGray,80,"Ethereal mists gather at the far wall, causing it to fade in and out of focus.");
			-- depop as my job is done.
			eq.depop();
		end
	end
end

