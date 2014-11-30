function event_combat(e)
	if(e.joined == true) then
		if(e.self:GetRace() == 54) then
			e.self:Say("Orc stomp, orc kill - orc weapons, your blood will spill.");
		else
			e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
		end
	end
end

function event_death_complete(e)
	if(e.self:GetRace() == 54) then
		e.self:Say("My comrades will avenge my death.");
	end
end
