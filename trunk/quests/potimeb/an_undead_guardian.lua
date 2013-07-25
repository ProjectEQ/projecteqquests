function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,1);
end
