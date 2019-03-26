function event_death_complete(e)
	local qglobals = eq.get_qglobals();
	
	if(qglobals["sirran"] ~= "5" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009) == false) then
		eq.set_global("sirran","5",3,"M20");
		eq.spawn2(71058,0,0,955,-570,466,390); -- NPC: Sirran_the_Lunatic
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71013) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009)) then
		eq.update_spawn_timer(2630,1000); --update to respawn in 1 sec if vanquisher or guardian are still up
	end
end
