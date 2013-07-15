function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("I'm afraid I can't speak right now, %s. I'm waiting for someone very important to arrive.",e.other:GetName()));
	end
end
