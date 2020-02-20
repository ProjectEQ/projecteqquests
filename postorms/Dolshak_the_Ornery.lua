function event_spawn(e)
eq.set_timer('check_giants', 6 * 1000);
end

function event_timer(e)
  if (e.timer == 'check_giants') then
	  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(210037) == true or eq.get_entity_list():IsMobSpawnedByNpcTypeID(210038) == true or eq.get_entity_list():IsMobSpawnedByNpcTypeID(210015) == true) then
	  eq.depop();
	  end
  end
end
