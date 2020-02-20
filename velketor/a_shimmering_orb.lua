function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 65, ex + 65, ey - 65, ey + 65, ez - 10, ez + 20);
end

function event_enter(e)
	e.self:CastSpell(2098,e.other:GetID(),0,1); -- Spell: Nulling Void
end
