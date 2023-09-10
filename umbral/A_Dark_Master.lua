function event_death_complete(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(176042) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(176105) then
    eq.spawn2(176088,0,0,120,-297.5,5,127); -- NPC: #Doomshade
    eq.zone_emote(MT.NPCQuestSay, "a tortured scream echoes throughout the plains as a tormented spirit is released upon the land");
    eq.depop_with_timer(176105);
  end
end
