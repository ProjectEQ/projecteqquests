--an_undead_guardian
--Phase 2 Undead
--potimeb

function event_death_complete(e)
	--signal phase_two_controller
	eq.signal(223242,2);
end
