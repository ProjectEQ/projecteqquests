--Warrior Epic 1.5
function event_death_complete(e)
	if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(301027) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(301063) == false) then -- check other slashers
		eq.unique_spawn(301063  ,0,0,835,-650,-755,60);	-- NPC: Girplan Devourer
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, 0, 100,"A massive girplan devourer emerges nearby to challenge those who have destroyed its kind.");
	elseif (eq.get_entity_list():IsMobSpawnedByNpcTypeID(301027) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(301063) == true) then -- check other slashers and devourer
		eq.spawn2(301085  ,0,0,835,-650,-755,60);	-- NPC: Girplan_Lacerator (301085)
	end
end
