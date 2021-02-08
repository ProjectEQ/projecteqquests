function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("avapower",35*1000);
		eq.set_timer("bury",30*1000);
		eq.set_timer("wave",12*1000);		
	end
end

function event_timer(e)
	if (e.timer=="depop") then
		eq.depop();
	elseif(e.timer=="avapower") then
		e.self:CastSpell(808, e.self:GetTarget():GetID()); -- Spell: Avatar Power
	elseif (e.timer=="bury") then
		e.self:CastSpell(5001, e.self:GetTarget():GetID()); -- Spell: Bury
	elseif (e.timer=="wave") then
		e.self:CastSpell(4493, e.self:GetTarget():GetID()); -- Spell: Earth Wave
	end
	
end

