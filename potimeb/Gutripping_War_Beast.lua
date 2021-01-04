--Gutripping_War_Beast (223146)
--Phase 2 Mini-boss
--potimeb

function event_death_complete(e)
	eq.signal(223097,223146); -- Add Loot Lockout for Phase 2 Wing
	eq.signal(223242,1); --signal phase_two_controller
end
