function event_death_complete(e)
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(222001) == false) then
 	  eq.spawn2(222017, 0, 0, 21, 322, -20, 127); -- NPC: #War_Chieftan_Birak
 	  eq.depop_with_timer(222021);
  end
end
