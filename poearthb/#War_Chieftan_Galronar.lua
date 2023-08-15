function event_death_complete(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222020) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222022) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222021) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(222023) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222016) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222017) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222018) then
		eq.signal(222023,0); -- NPC: #Warlord_Spawner
	end
end
