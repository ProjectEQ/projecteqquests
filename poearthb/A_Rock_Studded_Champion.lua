function event_death_complete(e)
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(222000) == false) then
 	  eq.spawn2(222018, 0, 0, 60, 40, -20, 0); -- NPC: #War_Chieftan_Galronar
 	  eq.depop_with_timer(222020);
  end
end
