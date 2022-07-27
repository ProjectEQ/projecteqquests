--Earthen_Overseer (223134)
--Phase 2 Mini-boss
--potimeb

function event_death_complete(e)
	eq.signal(223097,223134); -- Add Loot Lockout for Phase 2 Wing
	eq.signal(223242,1); --signal phase_two_controller
end
