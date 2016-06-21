function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(qglobals["ranger_epic"] == "1" and qglobals["ranger_epic_wyv"] == nil and el:IsMobSpawnedByNpcTypeID(120136) == false) then
		eq.unique_spawn(120136,21,0,-2671,1038,-23,94); 	
		eq.set_global("ranger_epic_wyv","1",2,"H2");
	end	
end
