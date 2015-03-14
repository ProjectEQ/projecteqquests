function event_death_complete(e)
	-- send a signal to the Innoruuk that I died
	eq.signal(223000,1);
end