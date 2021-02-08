function event_death_complete(e)
	e.self:Shout("Your kind will not defile the temple of Rallos Zek!");
end

function event_combat(e)

	if (e.joined) then
		eq.signal(113120, 1); -- NPC: a_temple_guardian
	end
end
