function event_spawn(e)
	-- create a despawn timer because on live we nevre seen more than a
	-- handful spawned at one time and no daths recorded in EQ /log
	eq.set_timer("depop_me",300000);
end

function event_timer(e)
	if (e.timer == "depop_me") then
		eq.depop();
	end
end