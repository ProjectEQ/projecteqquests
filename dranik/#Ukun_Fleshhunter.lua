-- will despawn while in combat if timer is met

function event_spawn(e)
  eq.set_timer("depop", 1200 * 1000); -- 20 min guess for now
end


function event_timer(e)
  if (e.timer == "depop") then
    eq.depop_with_timer();
  end
end
