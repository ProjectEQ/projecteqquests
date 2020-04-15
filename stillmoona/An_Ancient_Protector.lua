function event_death_complete(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(338167) == false) then
    eq.spawn2(338166,0,0,154,710,43.7,384); -- NPC: a_stillmoon_treasure_chest
  end
end
