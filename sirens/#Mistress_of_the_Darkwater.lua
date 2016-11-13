--Wizard Epic 1.5 Mistress prevent Mistress double spawn
function event_spawn(e)
	local el = eq.get_entity_list();
	local mistress_id = 125045; -- Mistress of the Darkwater
	
	if(el:IsMobSpawnedByNpcTypeID(125075) == true) then --##Mistress of the Darkwater
		eq.update_spawn_timer(mistress_id, 1800*1000);
		eq.depop();
	end
end