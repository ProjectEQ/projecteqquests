function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you for a moment. 'I don't believe I know you. Perhaps you meant to bother someone else. Speak with Melion, perhaps he can teach you your station.'");
	end
end