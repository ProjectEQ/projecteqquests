function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Good evening to you. %s. Beware. We have had reports of the undead prowling about on the plains just north of there. Evil is growing here in Qeynos. I can sense it.",e.other:GetName()));
	end
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end