-- Ardent_Phoenix_of_Xegony  NPCID: 215059
function event_death_complete(e)
	-- send a signal to #Mist_Trigger
	eq.signal(215455, 4, 2000);
end