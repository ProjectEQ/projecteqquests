function event_death_complete(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(340413) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340412) == false) then
eq.signal(340395,1); -- NPC: #Lore_Warden
eq.signal(340391,1); -- NPC: Messenger_Drake
end
end
