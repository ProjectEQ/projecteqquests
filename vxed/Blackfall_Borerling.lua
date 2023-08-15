--vxed/Blackfall_Boreling.lua NPCID 
--Warrior Epic 1.5
function event_death_complete(e)
	--	eq.zone_emote(MT.Yellow, "dead");
 	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(290070) then
		eq.spawn2(290069 ,0,0,-1129,-499,470,397.2); --Blackfall Borer
		eq.zone_emote(MT.Yellow, "The beast is awaiting you up the hill.");
	end
end
