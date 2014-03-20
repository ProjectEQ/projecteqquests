-- a_fire_goblin_scout.lua NPCID: PENDING
-- 10% chance to spawn Scorchfist on death
function event_death_complete(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(scorchfist)==false) then
		if(math.random(100) < 10) then
			-- pending NPCID
			-- eq.spawn2(PENDING,101,0,820,1270,-77.9,193);
		end
	end
end