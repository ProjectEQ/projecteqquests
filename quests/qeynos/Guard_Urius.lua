function event_say(e)
  if(e.message:findi("hail")) then
    e.self:Say(string.format("Greetings, %s! Be sure you watch your purse when walking around Qeynos at night. There seem to be a lot more thieves operating here than there used to be. We guards are doing our best to keep you safe. though.",e.other:GetName()));
  end
end
