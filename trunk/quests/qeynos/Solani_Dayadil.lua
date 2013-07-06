local count = 0;

function event_spawn(e)
	eq.set_timer("1",1000);
	e.self:SetRunning(true);
end

function event_timer(e)
	count = count + 1;
	local ztime = eq.get_zone_time();
	if((count == 1) and (ztime.zone_time > 599 and ztime.zone_time < 1800)) then
		eq.start(59);
	elseif((count == 1) and (ztime.zone_time < 600 or ztime.zone_time > 1799)) then
		eq.stop();
		eq.move_to(-260,-26,3.75,176);
	elseif(count == 2) then
		count = 0;
		eq.stop_timer("1")
		eq.set_timer("1",34000);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("If you are a fellow merchant. I must warn you of the inevitable tax increase.  Antonius Bayle is soon to make a [deal] with the people of Surefall Glade.");
	elseif(e.message:findi("deal")) then
		e.self:Say("Bayle is soon to sign a law which will raise the taxes on all bear hides.  This is to keep the purchase of the hides to a minimum.  All this to keep the treehuggers happy!!");
	end
end
