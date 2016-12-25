local atten_spawn = 0;

function event_spawn(e)
  eq.spawn2(335023, 0, 0, -1534, 177.59, 533.82, 51.1);
  eq.spawn2(335023, 0, 0, -1527.29, 243.01, 533.62, 85);
  eq.spawn2(335023, 0, 0, -1482.08, 283, 533.07, 113.4);
  eq.spawn2(335023, 0, 0, -1420.82, 285.91, 533.89, 142.1);
  eq.spawn2(335023, 0, 0, -1373.5, 244.64, 534.46, 171.8);
  eq.spawn2(335023, 0, 0, -1371.02, 176.37, 533.16, 205.2);
  eq.spawn2(335023, 0, 0, -1417.62, 127.29, 533.18, 237.2);
  eq.spawn2(335023, 0, 0, -1486.03, 128.07, 533.11, 16);
end

function event_signal(e)
  if (e.signal == 10) then
    atten_spawn = atten_spawn + 1;
  end
  if (atten_spawn == 8) then
    eq.depop_with_timer();
    atten_spawn = 0;
  end
end
