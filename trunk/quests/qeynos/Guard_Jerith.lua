function event_say(e)
  if(e.message:findi("hail")) then
    e.self:QuestSay(e.other,string.format("Um, sorry, "..e.other:GetName()..". I don't wish to be rude, but I must not be distracted while I am at my post. Commander Bayle trusted me with this watch and I will not let him down.",e.other:GetName()));
  end
end

function event_signal(e)
  e.self:Say("Yes, sir!");
end
