--Rythor_of_the_Undead (223129)
--Phase 1 - Rythor of The Undead Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,2);
end
