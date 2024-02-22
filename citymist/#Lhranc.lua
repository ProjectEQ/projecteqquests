-- Part of SK Epic 1.0
function event_spawn(e)
	eq.set_timer("Depop", 7200000);
end

function event_death_complete(e)
	eq.spawn2(90189,0,0,28.1,1.4,7,192.5); ----Marl Kastane
end

function event_timer(e)
	eq.depop();
end
