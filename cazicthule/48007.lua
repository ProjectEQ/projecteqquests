function event_spawn(e)
	eq.set_timer('depop', 60 * 10 * 1000);
end

function event_timer(e)
	eq.depop();
end
