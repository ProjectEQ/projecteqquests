function event_spawn(e)
	eq.set_timer("gfay15min",10 * 60 * 1000); -- Live like is 15 minutes total
end

function event_timer(e)
	if e.timer == "gfay15min" then
		eq.stop_timer("gfay15min");
		e.self:Say("The portal to Luclin will become active in five minutes. Please begin gathering at the Spires if you wish to travel.");
		eq.set_timer("gfay5min",2 * 60 * 1000);
    elseif e.timer == "gfay5min" then
		eq.stop_timer("gfay5min");
		e.self:Say("As a reminder, the portal will become active in three minutes.");
		eq.set_timer("gfay3min",60 * 1000);
    elseif e.timer == "gfay3min" then
		eq.stop_timer("gfay3min");
		e.self:Say("Two minutes till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("gfay2min",60 * 1000);
    elseif e.timer == "gfay2min" then
		eq.stop_timer("gfay2min");
		e.self:Say("One minute till teleportation. Please be prepared to step inside the circle of Spires.");
		eq.set_timer("gfay1min",60 * 1000);
    elseif e.timer == "gfay1min" then
		eq.stop_timer("gfay1min");
		e.self:Say("The portal to Luclin is about to become active. Please stand inside the circle of Spires and have a shard upon your person.");
		eq.set_global("nexus_gfaydark","1",3,"S60"); -- when the portal is open, global is set true for 1 min.
		eq.set_timer("gfay15min",10 * 60 * 1000);
		-- eq.signal(54053,101); -- triggers the flavor
	end
end