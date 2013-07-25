function event_death_complete(e)
	-- send a signal to the #water_trigger that I died
	eq.signal(223172,1);
end