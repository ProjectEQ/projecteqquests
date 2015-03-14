function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Nice to meet you. %s. If you are a fellow bard. I must inform you that you will make no profit around here. Not with Guard McCluskey around.",e.other:GetName()));
	end
end
