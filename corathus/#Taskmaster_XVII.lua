function event_spawn(e)
  eq.set_timer('depop', 300 * 1000);
  eq.set_next_hp_event(75);
end

function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer('depop');
  else
    eq.set_timer('depop', 10 * 1000);
  end
end

function event_timer(e)
  eq.stop_timer('depop');
  eq.depop();
end

function event_hp(e)
  if (e.hp_event == 75) then
    eq.spawn2(365246, 17, 0, 442, 158, -48, 33):AddToHateList(e.self:GetHateRandom(),1); -- NPC: a_Creep_Reaper_toiler
    eq.spawn2(365246, 17, 0, 386, 226, -60, 283):AddToHateList(e.self:GetHateRandom(),1); -- NPC: a_Creep_Reaper_toiler
    eq.spawn2(365246, 17, 0, 325, 90, -47, 217):AddToHateList(e.self:GetHateRandom(),1); -- NPC: a_Creep_Reaper_toiler
    e.self:ModifyNPCStat("hp_regen", "20000");
    e.self:Say("'Taskmaster XVII is in need of repair. Commence repair sequence.'");
  end
end

function event_signal(e)
  if (e.signal == 80) then
    e.self:ModifyNPCStat("hp_regen", "100");
  end
end
