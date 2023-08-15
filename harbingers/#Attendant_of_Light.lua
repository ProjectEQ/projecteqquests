function event_death(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(335063) then
    eq.spawn2(335063, 0, 0, -1403, 391.99, 570.58, 269.2); -- NPC: Guardian_of_the_Beacon
    eq.zone_emote(MT.Yellow, "A wave of heat washes down from the highest levels of the spire as the signal beacon flares to life.");
  end
end
