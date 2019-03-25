function event_spawn(e)
	eq.set_timer("stop",5000);
end

function event_timer(e)
	eq.signal(1095,2); -- NPC: Bassanio_Weekin Satchels
	eq.signal(1120,2); -- NPC: Gahna_Salbeen Satchels
	eq.signal(1115,2); -- NPC: Barthal Weapons
	eq.signal(1078,2); -- NPC: Moran_Smith Weapons
	eq.signal(1094,2); -- NPC: Solani_Dayadil Armor
	eq.stop_timer("stop");
end