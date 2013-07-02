function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say("Hail! My name is Perin. If you had any smarts at all you would be careful who you talk to around here.");
  end
end
