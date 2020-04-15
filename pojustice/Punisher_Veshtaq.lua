function event_death_complete(e)
	-- Signal the #Event_Torture_Control that the boss has died
	eq.signal(201450, 1); -- NPC: #Event_Torture_Control
	-- Signal the Tribunal that the boss has died
	eq.signal(201438, 1); -- NPC: The_Tribunal Torture Trial
end
