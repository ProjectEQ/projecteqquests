function event_spawn(e)
eq.set_timer("depop",math.random(6, 12)*1000);
end

function event_timer(e)
eq.depop();
end
