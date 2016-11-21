local ice_crystal = 0;

function event_spawn(e)
  eq.spawn2(300023, 0, 0, 634, 64, 4.22,0);
  eq.spawn2(300023, 0, 0, 631, 216, 4.22,0);
  eq.spawn2(300023, 0, 0, 483, 211, 4.22,0);
  eq.spawn2(300023, 0, 0, 487, 69, 4.22,0);
end

function event_signal(e)
  if (e.signal == 90) then
    ice_crystal = ice_crystal + 1;
  end
  if (ice_crystal == 4) then
    eq.depop_all(300023);
    eq.zone_emote(0, "The crystals pulse with energy as a creature steps from the portal.");
    eq.spawn2(300063, 0, 0, 554,138,-6,255);
    eq.spawn2(300086, 0, 0, 634, 64, 4.22,0);
    eq.spawn2(300086, 0, 0, 631, 216, 4.22,0);
    eq.spawn2(300086, 0, 0, 483, 211, 4.22,0);
    eq.spawn2(300086, 0, 0, 487, 69, 4.22,0);
    eq.depop_with_timer();
    ice_crystal = 0;
  end
end
