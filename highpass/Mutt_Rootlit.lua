function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. stranger. I would talk to thee. but [Barn] has instructed me not to converse with strangers.");
	elseif(e.message:findi("Barn")) then
		e.self:Say("Barn is my hero. He saved me from a life on the evil streets in Freeport.");
	end
end
