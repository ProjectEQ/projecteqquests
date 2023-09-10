function event_combat(e)
if e.joined then
eq.stop_timer('depop');
eq.get_entity_list():GetNPCByNPCTypeID(340389):AddToHateList(e.other, 1);
eq.get_entity_list():GetNPCByNPCTypeID(340386):AddToHateList(e.other, 1);
eq.get_entity_list():GetNPCByNPCTypeID(340387):AddToHateList(e.other, 1);
else
eq.set_timer('depop', 10 * 1000);
end
end

function event_timer(e)
if (e.timer == 'depop') then
eq.stop_timer('depop');
eq.signal(340390,1); -- NPC: Large_event_control
end
end

function event_death_complete(e)
if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340389) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340388) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340387) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(340386) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(340390) then
eq.spawn2(340032, 0, 0, -2844, 3143, 307, 385); -- NPC: a_chest
eq.depop_with_timer(340390);
end
end
