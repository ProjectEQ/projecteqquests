function event_timer(e)
	if e.timer=="dt" then
		e.self:CastSpell(982, e.self:GetTarget():GetID()); --100k cazic touch
	end
end

function event_combat(e)
	if e.joined then
		e.self:CastSpell(982, e.other:GetID()); --100k cazic touch
		eq.set_timer("dt",30*1000);
	else
		eq.stop_timer("dt");
	end
end