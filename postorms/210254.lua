function event_spawn(e)
eq.set_timer('Dolshak', 1800 * 1000);
end

function event_timer(e)
eq.unique_spawn(210190, 0, 0, -1997, 1157, -455, 19); -- pop Dolshak_the_Ornery (210190)
eq.depop();
end
