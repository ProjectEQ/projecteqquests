function event_combat(e)
	if e.joined and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(341060) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(341061) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(341062) then
		eq.spawn2(341060,0,0,-1151,1044,26.10,253); -- NPC: Magma
		eq.spawn2(341061,0,0,-1190,1001,26.10,253); -- NPC: Molten
		eq.spawn2(341062,0,0,-1197,1039,26.10,253); -- NPC: Smolder
	else
		eq.set_timer("depop", 600 * 1000);
	end
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop_all(341060);
	eq.depop_all(341061);
	eq.depop_all(341062);
end
