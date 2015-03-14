function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s.  I am Deregan. I used to be an adventurer much like yourself. Of course I was not as frail and childlike as you appear to be.",e.other:GetName()));
	end
end
