--Tallon_Zek (223077)
--Phase 4
--potimeb

function event_death_complete(e)
	eq.signal(223097,223077); -- Add Loot Lockout
	eq.signal(223097,5); -- send a signal to the zone_status that I died
end