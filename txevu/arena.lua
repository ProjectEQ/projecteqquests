function event_spawn(e)
	eq.set_timer("spawncondition", 60 * 60 * 1000); --in 1 hour turn on arena spawn condition
end

function event_timer(e)
  eq.stop_timer("spawncondition");
  eq.spawn_condition("txevu", 0, 6, 1);
	--set arena trash spawn condition to on
end
