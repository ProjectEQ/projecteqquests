function event_spawn(e)
  eq.set_timer("despawn", 930 * 1000);
end

function event_timer(e)
  if (e.timer == "despawn") then
    eq.depop();
    eq.zone_emote(10, "The reclusive girplans slink back into their caves.");
  end
end

function event_death_complete(e)
  eq.spawn2(301078,0,0,-1254,175,-921.54,136.2);
end
-- spawn rog 2.0 mob
