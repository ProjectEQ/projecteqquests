function event_spawn(e)
  eq.set_timer('spawn', 6 * 1000);
end

function event_timer(e)
  if (e.timer == 'spawn') then
    eq.stop_timer('spawn');
    eq.spawn2(365243, 17, 0, 442, 158, -48, 33); -- NPC: #a_Creep_Reaper_toiler
    eq.spawn2(365243, 17, 0, 386, 226, -60, 283); -- NPC: #a_Creep_Reaper_toiler
    eq.spawn2(365243, 17, 0, 325, 90, -47, 217); -- NPC: #a_Creep_Reaper_toiler
    eq.spawn2(365243, 17, 0, 327, 181, -47, 246); -- NPC: #a_Creep_Reaper_toiler
  end
end
