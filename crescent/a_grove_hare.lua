function event_spawn(e)
	local random = math.random(5000,30000);
	e.self:RandomRoam(250, 250);
	eq.set_timer("roam",random);
end

function event_timer(e)
	e.self:RandomRoam(250, 250);
end