function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("What do you want with bothering Shorm? I have no time for the likes of you, %s! Clear my path or meet my blade!",e.other:GetName()));
	end
end

function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end