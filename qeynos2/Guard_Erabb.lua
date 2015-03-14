function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello, %s.  Shh..  Come here.  I am worried.  I am new to this job but already I get the feeling something is wrong.  I have seen one of the lieutenants talking to a suspected necromancer.  It appeared they were old friends.  Something dark is growing in Qeynos.  Be careful!",e.other:GetName()));
	end
end
