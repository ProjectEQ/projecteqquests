function event_death_complete(e)
	-- send a signal to the #earth_trigger that I died
	eq.signal(223169,1);
end