function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 10, xloc + 10, yloc - 10, yloc + 10);
end

function event_enter(e)
	e.self:Say("Begone intruder!");
	e.other:SpellFinished(2129, e.other); -- Feerrott Exile
end
