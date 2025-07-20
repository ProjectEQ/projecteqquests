-- he is done evolving
function event_spawn(e)
  eq.set_timer('depop', 14400 * 1000); -- depop after 4 hours to reset cycle
end

function event_timer(e)
  if (e.timer == 'depop') then
    eq.update_spawn_timer(43327, 14400 * 1000); -- 4 hours for new cycle
    eq.depop();
  end
end

function event_death_complete(e)
  eq.update_spawn_timer(43327, 14400 * 1000); -- 4 hours for new cycle
end