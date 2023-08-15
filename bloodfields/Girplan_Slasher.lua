--Warrior Epic 1.5
function event_death_complete(e)
	if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(301027) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(301063) then -- check other slashers
		eq.unique_spawn(301063  ,0,0,787,-672,-757,504);	-- NPC: Girplan Devourer
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 100,"A massive girplan devourer emerges nearby to challenge those who have destroyed its kind.");
	elseif not eq.get_entity_list():IsMobSpawnedByNpcTypeID(301027) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(301063) then -- check other slashers and devourer
		eq.spawn2(301085  ,0,0,787,-672,-757,504);	-- NPC: Girplan_Lacerator (301085)
		eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 100,"There is no sign of the girplan devourer, but a lesser lacerator has appeared nearby instead.");
	end
end
