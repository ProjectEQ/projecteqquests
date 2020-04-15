function event_signal(e)
	if (e.signal==1) then
		eq.start(1);
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 0) then
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	elseif(e.wp == 1) then
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	elseif(e.wp == 2) then
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	end
end

function event_waypoint_depart(e)
	if(e.wp == 0) then
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	elseif(e.wp == 1) then
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	elseif(e.wp == 2) then
		e.self:CastSpell(3011,e.self:GetID()); -- Spell: Sorrow Song
	end
end
