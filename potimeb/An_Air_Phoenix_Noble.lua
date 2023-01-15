--An_Air_Phoenix_Noble (223087)
--Phase 1 Air Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #air_trigger that I died
	eq.signal(223170,1);
end
