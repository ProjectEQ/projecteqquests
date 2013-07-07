function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Buy something!!  This is no tavern!  I am not selling conversation!");
	end
end
