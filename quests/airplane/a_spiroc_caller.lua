function event_death_complete(e)
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009)) then
		eq.update_spawn_timer(2632,1000); --update to respawn in 1 sec if vanquisher are still up
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
