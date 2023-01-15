--#Cazic_Thule (223166)
--Phase 5 God
--potimeb

function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,223166); -- Add Lockout
	eq.signal(223097,6);
end