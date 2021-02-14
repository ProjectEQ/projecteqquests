function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 20, xloc + 20, yloc - 20, yloc + 20);
end

function event_enter(e)
	e.self:Say("Begone intruder!");
	e.other:SpellFinished(2129, e.other); -- Feerrott Exile
end
