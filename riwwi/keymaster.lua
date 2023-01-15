function event_spawn(e)
	eq.set_timer("replenish", 3 * 1000);
end

function event_timer(e)
if (e.timer == "replenish") then
eq.stop_timer("replenish");
	local rand = math.random(1,5);
		if (rand == 1) then
      eq.create_ground_object(52154,-1,-201,1,0);
		elseif (rand == 2) then
      eq.create_ground_object(52154,-129,625,71,0);
		elseif (rand == 3) then
      eq.create_ground_object(52154,-736,-327,0,0);
		elseif (rand == 4) then
      eq.create_ground_object(52154,-172,-233,18,0);
		elseif (rand == 5) then
      eq.create_ground_object(52154,-678,495,-36,0);
		end
end
end

function event_signal(e)
  if(e.signal == 1) then
    eq.debug("key picked up");
    eq.set_timer("replenish", 5400 * 1000); --90min respawn
  end
end
