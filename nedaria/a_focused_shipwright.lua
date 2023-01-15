function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Emote("nods at you, taking a deep breath of salty air.");	
	end
end
