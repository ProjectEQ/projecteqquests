function event_death_complete(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(210237) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(210236) then
    eq.unique_spawn(210238,0,0,-207,669,-374,331); --Ston`Ruak,_Ancient_of_Trees (210238)
  end
end
