--Master`s_Apprentice (284094) signal WMVZ to respawn in 60s

function event_death_complete(e)
	eq.signal(284092, 2); -- NPC: Weapon_Master_Vtiink_Vzaan (284092)
end
