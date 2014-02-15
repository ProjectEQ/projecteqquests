-- NPCID: 289002 an_aneuk_ebonspirit
function event_death_complete(e)
	-- signal the controller to check if we are all dead
	eq.signal(289047,1);
end