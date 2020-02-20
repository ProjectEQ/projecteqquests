function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("growls at you like a fierce cave bear.");
	end
end
