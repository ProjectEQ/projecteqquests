function event_signal(e)
	eq.set_timer("Fail", 7200000);
	eq.set_timer("Start", 45000);
end

function event_timer(e)
	if e.timer == "Start" then
	eq.stop_timer('Start');
	eq.zone_emote(10,"A foul wind is felt carrying on it the stench of death and decay.  Suddenly a thunderous bang is heard throughout the crypt and then these words, 'Great soldiers of decay you are summoned forth to do battle with these infidels!'  All around the crypt echoes of footsteps and shuffling feet are heard.");
	eq.spawn_condition("codecay",0,1,1);
	
	elseif e.timer == "Fail" then
		eq.stop_timer("Fail");
		eq.depop_all(200043);
		eq.depop_all(200042);
		eq.depop_all(200062); -- Despawn all Quest NPC's that have spawned.
		eq.depop_all(200063);
		eq.depop_all(200064);
		eq.depop_all(200065);
		eq.depop_all(200046);
		eq.depop_all(200045);
		eq.depop_all(200044); -- Despawn all Kings if any spawned
		eq.depop_all(200047);
		eq.depop_all(200049);
		eq.depop_all(200048);
		eq.depop_all(200050);
		eq.depop_all(200051);
		eq.depop_all(200054);
		eq.depop_all(200053);
		eq.depop_all(200052);
		eq.depop_all(200022);
		eq.depop_all(200055);
		eq.depop_all(200056);
		eq.depop_all(200024);
		eq.spawn_condition("codecay",0,1,0);
	end
end
