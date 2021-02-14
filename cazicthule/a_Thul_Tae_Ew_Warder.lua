function event_spawn(e)
	local ex = e.self:GetX();
	local ey = e.self:GetY();
	local ez = e.self:GetZ();
	eq.set_proximity(ex - 10, ex + 10, ey - 10, ey + 10, ez - 1, ez + 10);
end

function event_enter(e)
	e.self:Say("Begone intruder!");
	e.other:SpellFinished(2129, e.other); -- Feerrott Exile
end
