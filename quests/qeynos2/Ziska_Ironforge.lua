function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to our home of the finest jewelers in all of Norrath.");
	elseif(e.message:findi("Tayla")) then
		e.self:Say("I know nothing.");
	end
end
