function event_death_complete(e)
  eq.signal(335062,10);
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(335051) == false) then
    eq.spawn2(335051, 0, 0, -1403, 391.99, 570.58, 134.6);
    eq.spawn2(335014, 0, 0, -1422, 383, 570.58, 134.6);
    eq.spawn2(335014, 0, 0, -1422, 383, 570.58, 134.6);
    eq.spawn2(335014, 0, 0, -1422, 383, 570.58, 134.6);
    eq.spawn2(335014, 0, 0, -1422, 383, 570.58, 134.6);
  end
end
