--A_Fierce_War_Boar (223139)
--Phase 5 RZ Army
--potimeb

function event_death_complete(e)
	-- send a signal to the Rallos_Zek that I died
	eq.signal(223001,1);
end