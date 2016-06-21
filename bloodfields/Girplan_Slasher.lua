--Warrior Epic 1.5
function event_death_complete(e)
 	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(301027) == false) then
		eq.spawn2(301063  ,0,0,835,-650,-755,30); --Girplan Devourer
	end
end