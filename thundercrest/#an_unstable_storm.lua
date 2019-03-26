function event_spawn(e)
	local which = math.random(3); -- Spawn one of these 3 Options
	if  (which == 1) then
			e.self:SetRunning(true);
			e.self:MoveTo(-3485.45,3012.34,299.27,273.0,true);
			eq.set_timer("Explode",6000);
	elseif (which == 2) then
			e.self:SetRunning(true);
			e.self:MoveTo(-3487.44,3267.19,300.40,6.8,true);
			eq.set_timer("Explode",6000);
	elseif (which == 3) then
			e.self:SetRunning(true);
			e.self:MoveTo(-3609.99,3145,295.38,386.8,true);
			eq.set_timer("Explode",6000);
	end
end

function event_timer(e)
	if (e.timer == "Explode") then
		e.self:CastSpell(6604, e.self:GetID()); -- Spell: Forcequake
		eq.depop();
	end
end
