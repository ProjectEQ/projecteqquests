function event_death_complete(e)
	-- send a signal to the zone_status that I died
	eq.signal(223097,5);
end