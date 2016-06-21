--nadox/player.lua  
--Shaman Epic 1.5
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	local el = eq.get_entity_list();
	
	if(qglobals["shaman_epic_nadox"] == "1" and qglobals["shaman_epic_nadoxrespawn"] == nil and el:IsMobSpawnedByNpcTypeID(227074) == false) then
		eq.unique_spawn(227319,0,0,-536,-393,24); --Spiritseeker Nadox		
		eq.set_global("shaman_epic_nadoxrespawn","1",2,"H2");
	end	
end
