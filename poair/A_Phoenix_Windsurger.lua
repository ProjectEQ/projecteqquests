-- A_Phoenix_Windsurger NPCID: 215069
function event_death_complete(e)
	-- send a signal to #Mist_Trigger
	eq.signal(215455, 1, 2000);
end