function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 50, ex + 50, ey - 50, ey + 50, ez - 10, ez + 20);
end

function event_enter(e)
	e.self:CastSpell(863,e.other:GetID(),0,1); -- Spell: Telekinesis
end
