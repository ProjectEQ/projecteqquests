function event_spawn(e)
  eq.set_timer('spawn', 6 * 1000);
end

function event_timer(e)
  if (e.timer == 'spawn') then
    eq.stop_timer('spawn');
    eq.spawn2(340389, 0, 0, -2969, 3380, 275, 199);
    eq.spawn2(340388, 0, 0, -2970, 3002, 272, 61);
    eq.spawn2(340387, 0, 0, -2715, 3002, 275, 457);
    eq.spawn2(340386, 0, 0, -2715, 3380, 272, 325);
  elseif (e.timer == 'repop') then
    eq.stop_timer('repop');
    eq.unique_spawn(340389, 0, 0, -2969, 3380, 275, 199);
    eq.unique_spawn(340388, 0, 0, -2970, 3002, 272, 61);
    eq.unique_spawn(340387, 0, 0, -2715, 3002, 275, 457);
    eq.unique_spawn(340386, 0, 0, -2715, 3380, 272, 325);
  end
end

function event_signal(e)
  if (e.signal==1) then
    eq.depop_all(340389);
    eq.depop_all(340388);
    eq.depop_all(340387);
    eq.depop_all(340386);
    eq.set_timer('repop', 10 * 1000);
  end
end
