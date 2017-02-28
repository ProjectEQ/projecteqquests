function event_combat(e)
	if e.joined then
		e.self:Say("You dare confront me?!  All attack!")
	end
end

function event_death_complete(e)
	e.self:Emote("'s corpse draws a final breath while clawing at its fatal wounds.")
end
