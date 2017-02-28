function event_combat(e)
	if e.joined then
		e.self:Say("You will steal no more!  All of this is ours!")
	end
end

function event_death_complete(e)
	e.self:Emote("'s corpse mumbles a fading, final prayer.")
end
