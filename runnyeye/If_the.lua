function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	local msgc = eq.ChooseRandom(0,4,5,13,14,15,21);
	e.other:SendColoredText(msgc, "If the people of Rivervale hate the goblins so much, why do they not simply root this place out?  Probably because they are not that foolish.  'One with the Wall' indeed!");
end
