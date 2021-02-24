function event_combat(e)
	if ( e.joined ) then
		eq.set_timer("hatchling", 30000);
	else
		eq.stop_timer("hatchling");
	end
end

function event_timer(e)
	if ( e.timer == "hatchling" ) then
		-- spawn an_abhorrent_hatchling or a_rapacious_hatchling or a_voracious_hatchling
		eq.spawn2(eq.ChooseRandom(204084, 204083, 204082), 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0);
	end
end
