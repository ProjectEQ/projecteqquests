function event_spawn(e)
	e.self:RandomRoam(500,500);
	eq.set_timer("roam",math.random(5000,30000));
end

function event_timer(e)
	eq.stop_timer(e.timer);
	e.self:RandomRoam(500,500);
	eq.set_timer("roam",math.random(5000,30000));
end