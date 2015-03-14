function event_spawn(e)
	local random = math.random(1000,720000); 
	eq.set_timer("pick",random)
end

function event_timer(e)
	e.self:Emote("picks up something from the ground.");
end
