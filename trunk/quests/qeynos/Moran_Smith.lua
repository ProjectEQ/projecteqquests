local count = 0;

function event_spawn(e)
	eq.set_timer("1",1000);
	e.self:SetRunning(true);
end

function event_timer(e)
	count = count + 1;
	local ztime = eq.get_zone_time();
	if((count == 1) and (ztime.zone_time > 599 and ztime.zone_time < 1800)) then
		eq.start(60);
	elseif((count == 1) and (ztime.zone_time < 600 or ztime.zone_time > 1799)) then
		eq.stop();
		eq.move_to(-268,-38,3.75,243);
	elseif(count == 2) then
		count = 0;
		eq.stop_timer("1")
		eq.set_timer("1",36000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!!  Moran here.  I just love this city.  I traveled from Freeport to Qeynos to stay far from the [Freeport Militia].");
	elseif(e.message:findi("freeport militia")) then
		e.self:Say("The Freeport Militia are nothing more than thugs.  I have seen them lay waste to more than a dozen adventurers at once.  For no reason other than to flex their muscles!");
	end
end
