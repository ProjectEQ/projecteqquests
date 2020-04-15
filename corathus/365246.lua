function event_death_complete(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(365246) == false) then
    eq.signal(365290,80); -- NPC: #Taskmaster_XVII
  end
end
