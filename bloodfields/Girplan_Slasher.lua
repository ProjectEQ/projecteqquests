--Warrior Epic 1.5
function event_death_complete(e)
 	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(301027) == false) then
		eq.spawn2(301063  ,0,0,835,-650,-755,60); --Girplan Devourer
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"A massive girplan devourer emerges nearby to challenge those who have destroyed its kind.");
	end
end
