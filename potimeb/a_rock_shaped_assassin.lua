--a_rock_shaped_assassin (223147)
--Phase 1 - Terlok of Earth Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #earth_trigger that I died
	eq.signal(223169,1);
end