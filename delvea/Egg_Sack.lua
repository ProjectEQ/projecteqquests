function event_spawn(e)
	eq.set_timer("Hatch",30000);
end


function event_timer(e)
	if (e.timer == "Hatch") then
		eq.zone_emote(10,"Egg Sac bursts open releasing spiders.");
		eq.spawn2(341065,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Magma_Spiderling
		eq.spawn2(341065,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: Magma_Spiderling
		eq.depop(341064);
	end
end
