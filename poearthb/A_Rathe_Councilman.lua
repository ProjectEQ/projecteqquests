function event_combat(e)
	if not e.joined then
			eq.set_timer("punt", 6 * 1000);
	end
end

function event_timer(e)
	if e.timer == "punt" then
		e.self:GotoBind();
	end
end
