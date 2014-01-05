function event_spawn(e)
	eq.set_timer("nkar15min",600000); -- Live like is 15 minutes
end

function event_timer(e)
	if(e.timer == "nkar15min") then
		eq.stop_timer("nkar15min");
		e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
		eq.set_timer("nkar5min",120000);
	elseif(e.timer == "nkar5min") then
		eq.stop_timer("nkar5min");
		e.self:Say("As a reminder, the portal will become active in three minutes.");
		eq.set_timer("nkar3min",60000);
	elseif(e.timer == "nkar3min") then
		eq.stop_timer("nkar3min");
		e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("nkar2min",60000);
	elseif(e.timer == "nkar2min") then
		eq.stop_timer("nkar2min");
		e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("nkar1min",60000);		
	elseif(e.timer == "nkar1min") then
		eq.stop_timer("nkar1min");
		e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
		eq.set_global("nexus","1",3,"S60"); -- when the portal is open, global is set true for 1 min.
		eq.set_timer("nkar15min",600000);
		eq.signal(13022,101); -- triggers the flavor
	end
end
