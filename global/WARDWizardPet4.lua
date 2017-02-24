function event_spawn(e)
	eq.set_timer("first_cast",1000);
	eq.set_timer("cast_spell",10*1000);
end

function event_timer(e)
	if e.timer=="cast_spell" then
		e.self:CastSpell(4841, e.self:GetID()); --Aura of Fire
	elseif e.timer=="first_cast" then
		e.self:CastSpell(4841, e.self:GetID()); --Aura of Fire
		eq.stop_timer("first_cast");
	end
end