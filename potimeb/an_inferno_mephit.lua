function event_death_complete(e)
	-- send a signal to the #fire_trigger that I died
	eq.signal(223173,1);
end