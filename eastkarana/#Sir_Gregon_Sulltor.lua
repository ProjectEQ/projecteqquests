function event_combat(e)
	if(e.joined == true) then
		e.self:Say("You are a fool to have attacked me!");
	end
end

function event_death_complete(e)
	e.self:Say("Evil shall never triumph over good!");
end
