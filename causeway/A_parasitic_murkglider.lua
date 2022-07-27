function event_death(e)
  e.self:CastSpell(2321, 0); -- Spell: Energy Burst
end

function event_spawn(e)
eq.set_timer("depop", 90 * 1000);
end

function event_combat(e)
if(e.joined) then
eq.stop_timer("depop");
else
eq.set_timer("depop", 90 * 1000);
end
end

function event_timer(e)
if (e.timer == "depop") then
eq.depop();
end
end
