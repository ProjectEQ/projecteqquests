--vxed/Blackfall_Boreling.lua NPCID 
--Warrior Epic 1.5
function event_death_complete(e)
--	eq.zone_emote(15, "dead");
 	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(290070) == false) then
		eq.spawn2(290069 ,0,0,-1129,-499,470,198.6); --Blackfall Borer
		eq.zone_emote(15, "The beast is awaiting you up the hill.");
	end
end