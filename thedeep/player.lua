function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(qglobals["ranger_epic"] == "2" and qglobals["ranger_epic_deep"] == nil and el:IsMobSpawnedByNpcTypeID(164123) == false) then
		eq.unique_spawn(164123,0,0,346,-856,-60.5,0); 	
		eq.set_global("ranger_epic_deep","1",2,"H2");
	end	
end
