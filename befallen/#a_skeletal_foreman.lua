function event_spawn(e)
	e.self:Shout("Dig! Dig faster, you fools! Our masters say this ghost is all that stands in the way of the great one's return. Uncover his hiding place so that the forces of the Burning Dead might destroy him and recover its legacy!");
	eq.set_timer("shout", 5 * 60 * 1000); -- 5 Minutes
end

function event_timer(e)
	if e.timer == "shout" then
		e.self:Shout("Dig! Dig faster, you fools! Our masters say this ghost is all that stands in the way of the great one's return. Uncover his hiding place so that the forces of the Burning Dead might destroy him and recover its legacy!");
	end
end

function event_death_complete(e)
	eq.unique_spawn(36091,0,0,-43.5,-339.8,-10.9,0); -- NPC: Sir Ariam Arcanum
end
