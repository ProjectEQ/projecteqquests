-- 297161 an_aneuk_nervehammer part of ZMTZ event


function event_combat(e)
	if (e.joined) then
		eq.set_timer("checks", 1000)	
	else
		eq.stop_all_timers();
	end
end


function event_timer(e)
	if (e.self:GetX() < 1218) then
		e.self:GMMove(1306, 0, -304, 384)
		e.self:WipeHateList()
	end
end
