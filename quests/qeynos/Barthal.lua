local count = 0;

function event_spawn(e)
	eq.set_timer("1",1000);
end

function event_timer(e)
	count = count + 1;
	local ztime = eq.get_zone_time();
	if((count == 1) and (ztime.zone_time > 599 and ztime.zone_time < 1800)) then
		eq.start(61);
	elseif((count == 1) and (ztime.zone_time < 600 or ztime.zone_time > 1799)) then
		eq.stop();
		eq.move_to(-276,-32,3.75,50);
	elseif(count == 2) then
		count = 0;
		eq.stop_timer("1")
		eq.set_timer("1",28000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, $name! We've got the best prices in town..  No need to shop around..  Heh, heh. I think I'll make that my new slogan!");
	end
end

function event_signal(e)
	if(e.signal == 3) then
		e.self:Say("Heh.. Why don't you try Freeport.. or Erudin.. ANYwhere but here!");
	end
end
