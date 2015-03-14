function event_death_complete(e)
	-- send a signal to the #air_trigger that I died
	eq.signal(223170,1);
end
