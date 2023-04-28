function event_spawn(e)
	eq.set_timer("check_named", 5 * 1000);
end

function event_timer(e)
	local is_name_spawned = eq.get_entity_list():GetMobByNpcTypeID(292018);
	if is_name_spawned then
		eq.spawn2(292021,0,0,-1227,-628,-5,0); -- NPC: #Tqiv_Qukret_the_Furious
		eq.depop_with_timer();
	end
end
