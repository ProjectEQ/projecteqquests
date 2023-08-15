function event_combat(e)
	if e.joined then
		eq.set_timer("rain", math.random(3,60) * 1000);
		eq.set_timer("breath", math.random(3,45) * 1000);
		eq.set_timer("pres", math.random(3,30) * 1000);
	else
		eq.stop_timer("rain");
		eq.stop_timer("breath");
		eq.stop_timer("pres");
	end
end

function event_timer(e)
	if e.timer=="rain" then
		e.self:CastSpell(3764, e.self:GetTarget():GetID()); -- Spell: Rain of Bile
		eq.set_timer("rain", 60 * 1000);
	elseif e.timer=="breath" then
		e.self:CastSpell(6112, e.self:GetTarget():GetID()); -- Spell: Fetid Breath
		eq.set_timer("breath", 60 * 1000);	
	elseif e.timer=="pres" then
		e.self:CastSpell(6113, e.self:GetTarget():GetID()); -- Spell: Disconcerting Presence
		eq.set_timer("pres", 120 * 1000);	
	end
end