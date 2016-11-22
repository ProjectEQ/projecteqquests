--eastwastes/player.lua  
--Warrior Epic 2.0
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["warrior_epic"] == "18" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(NPCID) == false) then --NPCID is #Larnik_Trigger ID
		--eq.spawn2( ,0,0, , , , ) --#Larnik_Trigger
	end
end
	
-- Not sure how to make map lead u to the trigger, after 8pm game time