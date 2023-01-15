--Avatar_of_the_Elements (223073)
--Phase 3 Final Boss 
--potimeb

function event_death_complete(e)
	eq.signal(223097,223073); -- Add Loot Lockout
	eq.signal(223097,4); -- send a signal to the zone_status that I died
end