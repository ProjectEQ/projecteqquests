function event_timer(e)
	if e.timer=="dt" then
		e.self:CastSpell(982, e.self:GetTarget():GetID()); --100k cazic touch
	end
end

function event_combat(e)
	if e.joined then
		e.self:CastSpell(982, e.other:GetID()); --100k cazic touch
		eq.set_timer("dt",30*1000);
	else
		eq.stop_timer("dt");
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