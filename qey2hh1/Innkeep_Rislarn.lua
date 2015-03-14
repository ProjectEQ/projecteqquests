function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Welcome to my shop %s. You'll be happy to hear that I'm fully stocked. It's nice that things are back to normal now that the plague is over.",e.other:GetName()));
	end
end

-- END of FILE Zone:qey2hh1  ID:2742 -- Innkeep_Rislarn