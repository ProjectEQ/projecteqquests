function event_spawn(e)
	eq.set_timer("stop",5000);
end

function event_timer(e)
	eq.signal(1095,2);
	eq.signal(1120,2);
	eq.signal(1115,2);
	eq.signal(1078,2);
	eq.signal(1094,2);
	eq.stop_timer("stop");
end