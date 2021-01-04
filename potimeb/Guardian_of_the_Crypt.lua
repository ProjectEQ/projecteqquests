--Guardian_of_the_Crypt (223194)
--Phase 5 (Bert Army)
--potimeb

function event_death_complete(e)
	-- send a signal to Bertoxxulous that I died
	eq.signal(223098,1);
end