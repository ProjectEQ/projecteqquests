function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s. You'd better not be in Qeynos to start trouble. Commander Kane has little patience for ruffians. If he were in charge of Qeynos, things would be much better.",e.other:GetName()));
	end
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end