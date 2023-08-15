function event_death_complete(e)
if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340382) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340383) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340384) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340396) then
eq.spawn2(340397, 11, 0, 221, 1293, -19, 0); -- NPC: #Thunderhead
eq.spawn2(340397, 10, 0, 1014, 80, 39, 0); -- NPC: #Thunderhead
eq.spawn2(340397, 9, 0, 770, -1172, 18.6, 0); -- NPC: #Thunderhead
eq.spawn2(340398, 0, 0, 1033, 667, -2.5, 380); -- NPC: #Raging_Thunderhead
eq.depop_with_timer(340396);
eq.zone_emote(MT.Yellow,"The air smells of ozone. A storm is brewing.");
end
end
