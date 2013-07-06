local count = 0;

function event_spawn(e)
	eq.set_timer("1",1000);
end

function event_timer(e)
	count = count + 1;
	local ztime = eq.get_zone_time();
	if((count == 1) and (ztime.zone_time > 599 and ztime.zone_time < 1800)) then
		eq.start(57);
	elseif((count == 1) and (ztime.zone_time < 600 or ztime.zone_time > 1799)) then
		eq.stop();
		eq.move_to(-269,-24,3.75,131);
	elseif(count == 2) then
		count = 0;
		eq.stop_timer("1")
		eq.set_timer("1",30000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. This is a grand city. I plan to make much profit here.");
	end
end
