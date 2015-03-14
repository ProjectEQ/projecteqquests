function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am not here for you to make fancy with!! Just order something!");
	end
end