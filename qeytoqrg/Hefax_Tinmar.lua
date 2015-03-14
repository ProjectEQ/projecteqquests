function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_signal(e)
	e.self:Say("Oh, great. I feel safe already.");
end
