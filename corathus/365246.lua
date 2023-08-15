function event_death_complete(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(365246) then
    eq.signal(365290,80); -- NPC: #Taskmaster_XVII
  end
end
