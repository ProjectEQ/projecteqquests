--an_undead_guardian (NPCIDS: 223105,223116,223121,223122,223149)
--Phase 1 - Rythor of The Undead Trial
--potimeb

function event_death_complete(e)
	-- send a signal to the #undead_trigger that I died
	eq.signal(223171,1);
end
