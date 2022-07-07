function event_spawn(e)
	eq.set_timer("hatch", 30 * 1000);
end

function event_timer(e)
	if (e.timer == "hatch") then
		eq.spawn2(300084, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(300084, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		-- 2 a_murk_hatchling per egg
		eq.depop();
	end
end
