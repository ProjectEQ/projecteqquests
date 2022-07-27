--223246 - #An_Unholy_Rock_Fiend
-- potimeb
-- earth p2 trial.

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
