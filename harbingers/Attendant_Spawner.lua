local atten_spawn = 0;

function event_spawn(e)
  eq.spawn2(335023, 0, 0, -1534, 177.59, 533.82, 102.2); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1527.29, 243.01, 533.62, 170); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1482.08, 283, 533.07, 226.8); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1420.82, 285.91, 533.89, 284.2); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1373.5, 244.64, 534.46, 343.6); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1371.02, 176.37, 533.16, 410.4); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1417.62, 127.29, 533.18, 474.4); -- NPC: a_dragorn_sycophant
  eq.spawn2(335023, 0, 0, -1486.03, 128.07, 533.11, 32); -- NPC: a_dragorn_sycophant
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
