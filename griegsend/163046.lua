function event_death_complete(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(163046) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(163045) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(163097) then
		eq.unique_spawn(163075, 0, 0, 2340, 503, 161, 256); -- NPC: #Grieg_Veneficus
		eq.depop_with_timer(163097);
	end
end
