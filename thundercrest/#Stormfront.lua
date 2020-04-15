function event_death_complete(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(340397) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340399) == false) then
eq.signal(340398,1); -- NPC: #Raging_Thunderhead
end
end
