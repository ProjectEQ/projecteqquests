function event_spawn(e)
		eq.set_timer("dt",math.random(1,5)*1000);	
end

function event_timer(e)
	if e.timer=="dt" then
		local targ=e.self:GetTarget():GetID();
		if (targ ~= nil and target ~=0) then
			e.self:CastSpell(982, targ); --100k cazic touch
			eq.set_timer("dt",30*1000);
		end
	end
end

function event_death_complete(e)
	local qglobals = eq.get_qglobals();
	
	if(qglobals["sirran"] ~= "5" and eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009) == false) then
		eq.set_global("sirran","5",3,"M20");
		eq.spawn2(71058,0,0,955,-570,466,195);
	end
	if(eq.get_entity_list():IsMobSpawnedByNpcTypeID(71013) or eq.get_entity_list():IsMobSpawnedByNpcTypeID(71009)) then
		eq.update_spawn_timer(2630,1000); --update to respawn in 1 sec if vanquisher or guardian are still up
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------