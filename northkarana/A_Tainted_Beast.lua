function event_spawn(e)
  eq.debug(e.self:GetCleanName() .. " spawned");
  eq.set_timer("despawn", 60 * 1000);
end

function event_combat(e)
  if (e.joined == true) then
    eq.stop_timer("despawn");
    eq.debug(e.self:GetCleanName() .. " joined combat - stopping the despawn timer.");
  else
    eq.set_timer("despawn", 60 * 1000);
    eq.debug(e.self:GetCleanName() .. " left combat - starting the 60 second despawn timer.");
  end
end

function event_timer(e)
  if (e.timer == "despawn") then
    eq.debug(e.self:GetCleanName() .. " despawning.");
    eq.stop_timer(e.timer);
    eq.depop();
  end
end

