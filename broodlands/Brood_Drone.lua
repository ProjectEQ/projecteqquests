function event_death_complete(e)
  if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(337060) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(337090) == false) then
    eq.spawn2(337254,0,0,1403,-282,26.47,253); -- NPC: The_Broodqueen
    eq.zone_emote(MT.Yellow, "You've really stirred up the nest this time! Something's rumbling around deep in the jungle and it's furious!");
  else
    eq.zone_emote(MT.Yellow, "The death of the drone has caused a rustle in the brush beyond. You can't make out what the noise was, but it sounds  big.");
  end
end

function event_hp(e)
--test
end
