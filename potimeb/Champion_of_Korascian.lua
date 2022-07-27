--Champion of Korascian - p2 Plane of Time
-- NPC 223123
--earth p2

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,1);
end

function event_signal(e)
	--signal from An Earthen Overseer
	if e.signal == 1 then
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetBodyType(1, true);
	end
end
