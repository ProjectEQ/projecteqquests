function event_death_complete(e)
  eq.signal(335062,10);
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(335051) == false) then
    eq.spawn2(335051, 0, 0, -1403, 391.99, 570.58, 269.2);
    eq.spawn2(335014, 0, 0, -1388, 374, 570.58, 269.2);
    eq.spawn2(335014, 0, 0, -1383, 407, 570.58, 269.2);
    eq.spawn2(335014, 0, 0, -1415, 408, 570.58, 269.2);
    eq.spawn2(335014, 0, 0, -1422, 383, 570.58, 269.2);
  end
end
