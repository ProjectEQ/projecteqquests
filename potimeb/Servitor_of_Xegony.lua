--Servitor_of_Xegony (223111)
--Phase 1 Air Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #air_trigger that I died
	eq.signal(223170,2);
end
