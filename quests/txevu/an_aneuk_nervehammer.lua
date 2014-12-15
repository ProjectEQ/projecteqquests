-- 297161 an_aneuk_nervehammer part of ZMTZ event

function event_spawn(e)
	eq.set_timer("checks", 1000)
end

function event_combat(e)
	if (e.joined) then
		eq.set_timer("checks", 1000)	
	else
		eq.stop_all_timers();
	end
end


function event_timer(e)
	local rClient = nil
	if (e.self:GetHateTop() == nil) then
		rClient = eq.get_entity_list():GetRandomClient(1445,0,-295,150)
	end

	if (rClient ~= nil) then
		e.self:AddToHateList(rClient, 1)
	end

	if (e.self:GetX() < 1218) then
		e.self:GMMove(1306, 0, -304, 192)
		e.self:WipeHateList()
	end
end