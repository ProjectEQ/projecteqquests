function event_death_complete(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(163046) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(163045) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(163097) == true) then
 	eq.unique_spawn(163075, 0, 0, 2340, 503, 161, 256); -- NPC: #Grieg_Veneficus
 	eq.depop_with_timer(163097);
end
end
