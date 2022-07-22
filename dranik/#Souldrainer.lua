-- will despawn while in combat if timer is met

function event_spawn(e)
  eq.set_timer("depop", 2700 * 1000); -- 45 min uptime
end


function event_timer(e)
  if (e.timer == "depop") then
    eq.depop_with_timer();
  end
end
