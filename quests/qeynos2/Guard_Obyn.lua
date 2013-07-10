function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello there. %s.  Obyn is my name.  Are you from Qeynos?  I was born here myself.  It's the best city in all of Norrath. if you ask me.  Well I'd better get back to guarding.",e.other:GetName()));
	end
end
