function event_spawn(e)
	eq.set_timer("setapp",1000);
end

function event_timer(e)
	e.self:SetAppearance(3);
end