--A_Crustacean_Champion (223136)
--Phase 2 
--potimeb

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,1);
end

function event_signal(e)
	--signal from A War Shapen Emmisary
	if e.signal == 1 then
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
		e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
		e.self:SetBodyType(BT.Monster, true);
	end
end
