-- #Inquisitor_Chiak_Tansk (297148)  NMTZ event

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("NS_Leash", 1000)
	else
		eq.stop_timer("NS_Leash")
	end
end

function event_timer(e)
	if (e.self:GetY() < -105 or e.self:GetY() > 105) then
			e.self:GMMove(1528, 30, -285, 192)
	end
end
