function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
end

function event_death_complete(e)
	eq.spawn2(303094,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --Discordling_Dark_Animist
end

function event_timer(e)
	if e.timer=="depop" then
		eq.depop_all(303093);
		eq.depop();
	end
end