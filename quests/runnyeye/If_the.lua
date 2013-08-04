function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	e.self:Emote("people of Rivervale hate the goblins so much, why do they not simply root this place out?  Probably because they are not that foolish.  'One with the Wall' indeed!");
end
