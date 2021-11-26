-- a_vengeful_apparition (297152)
-- jail mobs for ZMTZ

function event_spawn(e)
	eq.set_timer("depop", 30 * 1000);
end

function event_timer(e)
	eq.depop();
end
