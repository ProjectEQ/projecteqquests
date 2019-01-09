function event_death_complete(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(340382) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340383) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340384) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340396) == true) then
eq.spawn2(340397, 0, 0, 659, 1091, 19.5, 0);
eq.spawn2(340397, 0, 0, 770, 4, 2.7, 0);
eq.spawn2(340397, 0, 0, 776, -773, -3.5, 0);
eq.spawn2(340398, 0, 0, 1033, 667, -2.5, 380);
eq.depop_with_timer(340396);
eq.zone_emote(15,"The air smells of ozone. A storm is brewing.");
end
end
