function event_spawn(e)
	eq.set_timer("cast",500);
	eq.set_timer("depop",2000);
end

function event_timer(e)
	if(e.timer == "cast") then
		eq.stop_timer("cast");
		e.self:CastSpell(2815,e.self:GetID(),0,1); -- Spell: Shower of Blood
	elseif(e.timer == "depop") then
		eq.stop_timer("depop");
		eq.depop();
	end
end
