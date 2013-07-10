function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, citizen! While I have taken an oath to protect you. that does not mean I have to waste my breath talking to you.");
	end
end
