function event_spawn(e)
	eq.set_timer("dreadlands_timer", 60 * 1000); -- Spire Cycle Time : 13 minutes 30 seconds
	
	minute = 0
end

function event_timer(e)
	if (e.timer == "dreadlands_timer") then
		minute = minute + 1;
		
		if (minute == 8) then
			e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
		elseif (minute == 10) then
			e.self:Say("As a reminder, the portal will become active in three minutes.");
		elseif (minute == 11) then
			e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
		elseif (minute == 12) then
			e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
		elseif (minute == 13) then	
			eq.stop_timer("dreadlands_timer");
			eq.set_timer("dreadlands_opened", 20 * 1000);
			eq.set_timer("dreadlands_closed", 30 * 1000);
			
			minute = 0;
			
			e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
		end
	elseif (e.timer == "dreadlands_opened") then
		eq.stop_timer("dreadlands_opened");
	
		e.self:SetGlobal("nexus_dre", "1", 3, "F");
	
		eq.signal(86051, 101); -- Flavor casting
	elseif (e.timer == "dreadlands_closed") then
		eq.stop_timer("dreadlands_closed");
		eq.set_timer("dreadlands_timer", 60 * 1000);
		
		e.self:SetGlobal("nexus_dre", "0", 3, "F");
	end
end