function event_spawn(e)
  eq.set_timer("depop", 2220 * 1000);
end

function event_timer(e)
  if(e.timer=="depop") then
    eq.depop();
  end
end
