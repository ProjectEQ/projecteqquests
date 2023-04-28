function event_spawn(e)
	eq.set_timer("check_named", 5 * 1000);
end

function event_timer(e)
	local is_name_spawned = eq.get_entity_list():GetMobByNpcTypeID(292015);
	if is_name_spawned then
		eq.spawn2(292022,0,0,-537,-620,-5,4); -- NPC: #Tqiv_Araxt_the_Enraged
		eq.depop_with_timer();
	end
end
