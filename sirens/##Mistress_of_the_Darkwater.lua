--Wizard Epic 1.5 Spawn Mistress Quest version with timer
function event_spawn(e)
	eq.set_timer("mistress",3600*1000);
end

function event_timer(e)
	eq.stop_timer("mistress");
	eq.depop();
end

function event_death_complete(e)
	eq.set_global("wiz_epic_mistress_respawn","1",3,"H2");
end