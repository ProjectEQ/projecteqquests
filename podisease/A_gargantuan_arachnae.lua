function event_spawn(e)
eq.set_timer('adds', 60 * 1000);
end

function event_timer(e)
  if (e.timer == 'adds') then
    eq.spawn2(205162, 0, 0, 108, -3384, -220, 357); -- NPC: a_bubonian_cronie
    eq.stop_timer('adds');
  end
end
