function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am Delharn. from [Freeport]. I'm trying to earn some extra coin while passing through Highpass. I figure this is a pretty honorable way to do so.");
	end
end
