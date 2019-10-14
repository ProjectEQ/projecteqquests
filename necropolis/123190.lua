function event_spawn(e)
  eq.set_timer('Depop', 1800 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer('Depop');
  else
    eq.set_timer('Depop', 1800 * 1000);
  end
end
