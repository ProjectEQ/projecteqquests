-- 201461 Gallows_Master_Teion.lua
function event_death_complete(e)
	-- Send a Success when the Gallows Master Teion dies.
	eq.signal(201448, 7, 0); -- NPC: #Event_Hanging_Control

	-- Send the Agent of the Tribunal notification that players
	-- can leave the trial now that the boss is dead.
	eq.signal(201075, 13, 0); -- NPC: Agent_of_The_Tribunal
end
