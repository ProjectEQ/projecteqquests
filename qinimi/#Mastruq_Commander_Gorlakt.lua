function event_spawn(e)	
end

function event_combat(e)
	if e.joined==true then
		eq.set_timer("mind", math.random(5,15) * 1000);
		eq.set_timer("body", math.random(5,20) * 1000);
	else
		eq.stop_timer("mind");
		eq.stop_timer("body");
	end
end
  
function event_timer(e)
	if e.timer=="mind" then
		e.self:CastSpell(5808, e.self:GetTarget():GetID()); -- Spell: Mind Warp
		eq.set_timer("mind", 30 * 1000);		
	elseif e.timer=="body" then
		e.self:CastSpell(5809, e.self:GetTarget():GetID()); -- Spell: Body Warp
		eq.set_timer("body", 45 * 1000);		
	end
end