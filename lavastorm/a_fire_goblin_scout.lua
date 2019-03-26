-- a_fire_goblin_scout.lua NPCID: 27126
-- 10% chance to spawn #Scorchfist on death
function event_death_complete(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(scorchfist)==false) then
		if(math.random(100) < 10) then
			eq.spawn2(27126,101,0,820,1270,-77.9,386); -- NPC: #Scorchfist
		end
	end
end
