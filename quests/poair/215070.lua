-- #Melernil_Faal`Armanna  NPCID: 215070
function event_death_complete(e)
	-- send a signal to #Mist_Trigger
	eq.signal(215455, 2, 2000);
end