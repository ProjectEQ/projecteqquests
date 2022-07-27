--A_Deepwater_Assassin (223141)
--Phase 2 
--potimeb

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,1);
end

function event_signal(e)
	--signal from A War Shapen Emmisary
	if e.signal == 1 then
		e.self:SetSpecialAbility(25, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetBodyType(23, true);
	end
end
