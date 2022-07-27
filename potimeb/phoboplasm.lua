-- phoboplasm (223200)
--Phase 5 (CT Army)
--potimeb

function event_death_complete(e)
	-- send a signal to the Cazic_Thule that I died
	eq.signal(223165,1);
end