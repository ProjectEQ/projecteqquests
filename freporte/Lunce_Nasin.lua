function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello! Looking for a room? We have a few still empty.");
	end
end