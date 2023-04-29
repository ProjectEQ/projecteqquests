function event_spawn(e)
	eq.set_timer("anim", 1 * 1000) -- 3s to make npc lay down
end

function event_timer(e)
	if e.timer == "anim" then
		e.self:SetAppearance(3); -- Dead
		eq.stop_timer("anim");
	end
end
