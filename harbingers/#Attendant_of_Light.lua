function event_death(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(335063) == false) then
    eq.spawn2(335063, 0, 0, -1403, 391.99, 570.58, 134.6);
    eq.zone_emote(15, "A wave of heat washes down from the highest levels of the spire as the signal beacon flares to life.");
  end
end
