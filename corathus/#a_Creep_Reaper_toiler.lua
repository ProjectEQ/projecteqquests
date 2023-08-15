function event_death_complete(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(365243) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(365291) then
    eq.spawn2(365290,0,0,209,200,-46,201); -- NPC: #Taskmaster_XVII
    eq.depop_with_timer(365291);
  end
end
