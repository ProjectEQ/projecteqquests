function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if(qglobals["druid_epic"] == "12"  and eq.get_entity_list():IsMobSpawnedByNpcTypeID(87155) == false) then
		eq.unique_spawn(87155,0,0,0,3000,-259,0); -- NPC: #a_crippled_wurm
	end	
end
