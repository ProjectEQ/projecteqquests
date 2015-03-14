--nadox/player.lua  
--Shaman Epic 1.5
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["shaman_epic_nadox"] == "1" and qglobals["shaman_epic_nadoxrespawn"] == nil and eq.get_entity_list():IsMobSpawnedByNpcType(227074) == false) then
		--eq.spawn2(227319,0,0, , , , ); --Spiritseeker Nadox
		eq.set_global("shaman_epic_nadoxrespawn","1",2,"H2");
	end
end