function event_combat(e)
	if not e.joined then
	local roll = math.random(100)
		if roll >= 50 then
			eq.set_timer("punt", 12 * 1000);
		else
			eq.set_timer("punt", 6 * 1000);
		end
	end
end

function event_timer(e)
	if e.timer == "punt" then
		e.self:GotoBind();
		eq.stop_timer("punt");
	end
end
