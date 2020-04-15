function event_spawn(e)
	eq.set_timer("depop",30*60*1000)	
end

function event_combat(e)
	if e.joined==true then
		eq.set_timer("drain", math.random(5,15) * 1000);
	else
		eq.stop_timer("drain");
	end
end
  
function event_timer(e)
	if e.timer=="depop" then
		eq.stop_timer("depop")
		eq.depop();
	elseif e.timer=="drain" then
		e.self:CastSpell(4457, e.self:GetTarget():GetID()); -- Spell: Cursed Keeper's Drain
		eq.set_timer("drain", 600 * 1000);		
	end
end