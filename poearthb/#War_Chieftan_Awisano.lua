function event_death_complete(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(222020) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222022) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222021) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222023) == true and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222016) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222017) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222018) == false) then
		eq.signal(222023,0); -- NPC: #Warlord_Spawner
	end
end
