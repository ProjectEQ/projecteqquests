function event_spawn(e)
  eq.set_timer('spawn', 6 * 1000);
end

function event_timer(e)
  if (e.timer == 'spawn') then
    eq.stop_timer('spawn');
    eq.spawn2(2000902, 0, 0, -2969, 3380, 275, 199);
    eq.spawn2(2000900, 0, 0, -2970, 3002, 272, 61);
    eq.spawn2(2000901, 0, 0, -2715, 3002, 275, 457);
    eq.spawn2(2000899, 0, 0, -2715, 3380, 272, 325);
  end
end

function event_signal(e)
  if (e.signal==1) then
    eq.depop_all(2000902);
    eq.depop_all(2000900);
    eq.depop_all(2000901);
    eq.depop_all(2000899);
    eq.unique_spawn(2000902, 0, 0, -2969, 3380, 275, 199);
    eq.unique_spawn(2000900, 0, 0, -2970, 3002, 272, 61);
    eq.unique_spawn(2000901, 0, 0, -2715, 3002, 275, 457);
    eq.unique_spawn(2000899, 0, 0, -2715, 3380, 272, 325);
  end
end
