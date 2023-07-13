function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at the ground and mumbles, 'Me not allowed to talk to guests.'");
	end
end