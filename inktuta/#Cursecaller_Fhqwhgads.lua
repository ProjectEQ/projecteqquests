function event_combat(e)
	if not e.joined then
		eq.signal(296017, 2); -- NPC: #curse_trigger
	end
end
