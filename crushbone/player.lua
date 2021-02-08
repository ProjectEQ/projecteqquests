function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(qglobals["paladin_epic"] == "9" and qglobals["paladin_epic_crushbone"] == nil and el:IsMobSpawnedByNpcTypeID(58060) == false) then
		eq.unique_spawn(58060,21,0,166.4,153.3,18.2,384); -- NPC: #Orc_Messenger
		eq.set_global("paladin_epic_crushbone","1",3,"H2");
	end	
end
