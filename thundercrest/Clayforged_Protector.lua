function event_combat(e)
if (e.joined == true) then
eq.stop_timer('depop');
else
eq.set_timer('depop', 10 * 1000);
end
end

function event_timer(e)
if (e.timer == 'spawn') then
eq.stop_timer('depop');
eq.signal(2000903,1);
end
end

function event_death_complete(e)
if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(2000902) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(2000901) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(2000900) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(2000899) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(2000903) == true) then
eq.spawn2(340032, 0, 0, -2844, 3143, 307, 0);
eq.depop_with_timer(2000903);
end
end
