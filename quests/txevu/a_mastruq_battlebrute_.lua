-- 297222 a_mastruq_battlebrute part of ZMTZ event

function event_spawn(e) 
	eq.set_timer("leash", 1000)
end

function event_timer(e)
	if (e.self:GetX() < 1218) then
		e.self:GMMove(1306, 0, -304, 192)
		e.self:WipeHateList()
	end
end
