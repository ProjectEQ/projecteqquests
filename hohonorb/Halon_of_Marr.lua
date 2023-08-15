function event_death_complete(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(220012) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(220013) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(220014) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(220016) then
    eq.unique_spawn(220006,0,0,2727,0,471,387); --Lord_Mithaniel_Marr live version
    eq.depop_all(220015); --depop fake
  end
end
