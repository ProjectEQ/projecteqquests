--#Shadow_of_Neimon (223240)
--Phase 1 - Neimon of Air Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #air_trigger that I died
	eq.signal(223170,2);
end
