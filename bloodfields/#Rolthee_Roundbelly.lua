function event_spawn(e)
  eq.set_timer("despawn", 930 * 1000);
end

function event_timer(e)
  if (e.timer == "despawn") then
    eq.depop();
    eq.zone_emote(10, "The reclusive girplans slink back into their caves.");
  elseif e.timer=="blur" then
	e.self:WipeHateList();
  end
end

function event_combat(e)
	if e.joined==true then
		eq.set_timer("blur",15*1000);
	else
		eq.stop_timer("blur");
	end
end
function event_death_complete(e)
  eq.spawn2(301078,0,0,-1279,168,-924,212); -- NPC: #Keetra_the_Lost
end
-- spawn rog 2.0 mob
