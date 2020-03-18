function event_death_complete(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(210237) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(210236) == false) then
    eq.unique_spawn(210238,0,0,-207,669,-374,331); --Ston`Ruak,_Ancient_of_Trees (210238)
  end
end
