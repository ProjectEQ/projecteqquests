--A_Firebone_Caster (223195)
--Phase 5 (Bert Army)
--potimeb

function event_death_complete(e)
	-- send a signal to Bertoxxulous that I died
	eq.signal(223098,1);
end