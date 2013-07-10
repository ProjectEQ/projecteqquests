function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("")) then
		e.self:Say(string.format("Hail, %s.  If you are not busy, we can always use help keeping the beetle population under control in front of the gates.  But be careful, we have had sightings of a large queen beetle out there.",e.other:GetName()));
	end
end
