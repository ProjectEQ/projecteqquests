function event_death_complete(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222002) then
 	  eq.spawn2(222016, 0, 0, 259, 278, -20, 125); -- NPC: #War_Chieftan_Awisano
 	  eq.depop_with_timer(222022);
  end
end
