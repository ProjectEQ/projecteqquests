--Rythor_of_the_Undead (223129)
--Phase 1 - Rythor of The Undead Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,2);
	eq.set_global(eq.get_zone_instance_id() .. "_potimeb_Rythor","1",7,"H36");	
end
