function event_spawn(e)
  eq.set_timer("depop",1800000); --Despawn after 30 minutes
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
	eq.depop_all(57153);
	eq.signal(57150,2); -- NPC: Taskmaster_Mirot
end

function event_death_complete(e)
    e.self:Emote("As Mirot falls to the ground you see a letter in the pocket of his shirt.");
	eq.stop_timer("depop");
	eq.signal(57150,2); -- NPC: Taskmaster_Mirot
end