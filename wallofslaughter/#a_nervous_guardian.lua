function event_death_complete(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(300097) then
		eq.depop_all(300096);
		eq.spawn2(300098, 0, 0, 414.8,311,128.6,256); --lightning lord	
	end
end
