function event_spawn(e)
	eq.set_timer("blur",1000);
end

function event_timer(e)
	if e.timer=="first_cast" then
		--e.self:CastSpell(12948 ,e.self:GetTarget():GetID()); --Companion of Necessity Effect
		e.self:CastSpell(32141 ,e.self:GetTarget():GetID()); --Companion's Taunt
		eq.stop_timer("blur");
		eq.set_timer("taunt",1000);
	elseif e.timer=="taunt" then
		e.self:CastSpell(32141 ,e.self:GetTarget():GetID()); --Companion's Taunt
	end
end

function event_death(e)
	e.self:CastSpell(12948 ,e.self:GetTarget():GetID()); --Companion of Necessity Effect
end