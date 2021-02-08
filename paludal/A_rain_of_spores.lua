function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 65, ex + 65, ey - 65, ey + 65, ez - 10, ez + 20);
end

function event_enter(e)
	e.self:CastSpell(2770,e.other:GetID(),0,0); -- Spell: Rain of Spores
	eq.depop_with_timer();
end
