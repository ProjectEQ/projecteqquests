function event_death_complete(e)
	-- Signal the #Event_Torture_Control that the boss has died
	eq.signal(201450, 1);
	-- Signal the Tribunal that the boss has died
	eq.signal(201438, 1); 
end
