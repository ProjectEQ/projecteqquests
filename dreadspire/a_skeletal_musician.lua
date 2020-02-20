function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("is too busy performing to speak to you.");
	end
end
