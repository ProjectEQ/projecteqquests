function event_spawn(e)
	eq.set_timer("replenish", 3 * 1000);
end

function event_timer(e)
if (e.timer == "replenish") then
eq.stop_timer("replenish");
	local rand = math.random(1,4);
		if (rand == 1) then
      eq.create_ground_object(52154,-201,-1,4.7,0);
		elseif (rand == 2) then
      eq.create_ground_object(52154,625,-129,73,0);
		elseif (rand == 3) then
      eq.create_ground_object(52154,-327,-736,3,0);
		elseif (rand == 4) then
      eq.create_ground_object(52154,-172,-233,18,0);
		end
end
end

function event_signal(e)
  if(e.signal == 1) then
    eq.debug("key picked up");
    eq.set_timer("replenish", 5400 * 1000); --90min respawn
  end
end
