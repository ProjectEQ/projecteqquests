function event_combat(e)
	eq.signal(201450, 8); -- NPC: #Event_Torture_Control
end

function event_death_complete(e)
	eq.signal(201450, 8); -- NPC: #Event_Torture_Control
end
