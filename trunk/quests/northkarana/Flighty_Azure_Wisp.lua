function event_spawn(e)
	eq.set_timer("depop",600000); -- depop after 10 minutes
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

function event_combat(e)
	if(e.joined == true) then
		eq.stop_timer("depop"); -- don't depop while in combat
	else
		eq.set_timer("depop",600000); -- reset depop timer
  end
end

function event_death_complete(e)
	eq.stop_timer("depop");
end
