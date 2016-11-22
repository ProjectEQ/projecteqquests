function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(e.self:HasItem(69924) and qglobals["paladin_epic_ferubi"] == nil and el:IsMobSpawnedByNpcTypeID(284104) == false) then
		eq.unique_spawn(284104,0,0,883,703,98.5,32);		
		eq.set_global("paladin_epic_ferubi","1",3,"H2");
	end	
end
