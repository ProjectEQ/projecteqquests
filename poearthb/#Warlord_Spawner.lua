function event_signal(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222020) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222022) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(222021) then
    eq.unique_spawn(222019, 0, 0, 415,161,-55,383); -- NPC: #Warlord_Gintolaken
    eq.depop_with_timer();
  end
end
