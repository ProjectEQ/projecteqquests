function event_death_complete(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(186191) == false) then
    eq.signal(186111,80);
  end
end
