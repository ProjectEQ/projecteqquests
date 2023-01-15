function event_spawn(e)
	eq.set_timer("hatch", 30 * 1000);
end

function event_timer(e)
	if (e.timer == "hatch") then
		e.self:Emote("shatters as several small murkgliders emerge.");
		
		eq.spawn2(300084, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		eq.spawn2(300084, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		-- 2 a_murk_hatchling per egg
		eq.spawn2(300104, 0, 0, e.self:GetX(),e.self:GetY(),e.self:GetZ(),0);
		-- a_broken_egg (300104)
		eq.depop();
	end
end
