--Supernatural_Guardian (223074)
--Phase 3 Final Boss 
--potimeb

function event_death_complete(e)
	eq.signal(223097,223074); -- Add Loot Lockout
	eq.signal(223097,4); -- send a signal to the zone_status that I died
end