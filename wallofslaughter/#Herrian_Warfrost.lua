function event_spawn(e)
	eq.set_timer("depop",30*60*1000);
end

function event_combat(e)
	if (e.joined == true) then
		eq.set_timer("freeze", math.random(3,15)*1000);
		eq.set_timer("hoar",   math.random(3,15)*1000);
		eq.stop_timer("depop");
	else
		eq.stop_timer("freeze");
		eq.stop_timer("hoar");
		eq.start_timer("depop",5*60*1000);
	end
end

function event_timer(e)
	if (e.timer == "freeze") then
		e.self:CastSpell(5819, e.self:GetTarget():GetID()); -- Spell: Winter's Freeze
		eq.set_timer("freeze",20*1000);
	elseif e.timer=="hoar" then
		e.self:CastSpell(5818, e.self:GetTarget():GetID()); -- Spell: Hoarfrost
		eq.set_timer("hoar",20*1000);
	elseif e.timer=="depop" then
		eq.depop();
	end
end
