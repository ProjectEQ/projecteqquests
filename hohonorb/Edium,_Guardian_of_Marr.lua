function event_death_complete(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(220012) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(220013) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(220014) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(220016) == true) then
    eq.unique_spawn(220006,0,0,2727,0,471,387); --Lord_Mithaniel_Marr live version
    eq.depop_all(220015); --depop fake
  end
end
