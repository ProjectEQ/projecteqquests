function event_spawn(e)
	eq.set_timer("stop",5000);
end

function event_timer(e)
	eq.signal(1095,1);
	eq.signal(1120,1);
	eq.signal(1115,1);
	eq.signal(1078,1);
	eq.signal(1094,1);
	eq.stop_timer("stop");
end