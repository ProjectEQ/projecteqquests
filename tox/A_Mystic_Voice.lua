function event_spawn(e)
	eq.set_timer("tox15min",10 * 60 * 1000); -- Live like is 15 minutes
end

function event_timer(e)
	if e.timer == "tox15min" then
		eq.stop_timer("tox15min");
		e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
		eq.set_timer("tox5min",2 * 60 * 1000);
    elseif e.timer == "tox5min" then
		eq.stop_timer("tox5min");
		e.self:Say("As a reminder, the portal will become active in three minutes.");
		eq.set_timer("tox3min",60 * 1000);
    elseif e.timer == "tox3min" then
		eq.stop_timer("tox3min");
		e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("tox2min",60 * 1000);
    elseif e.timer == "tox2min" then
		eq.stop_timer("tox2min");
		e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("tox1min",60 * 1000);	
    elseif e.timer == "tox1min" then
		eq.stop_timer("tox1min");
		e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
		eq.set_global("nexus_tox","1",3,"S60"); -- when the portal is open, global is set true for 1 min.
		eq.set_timer("tox15min",10 * 60 * 1000);
		-- eq.signal(54053,101); -- triggers the flavor
	end
end