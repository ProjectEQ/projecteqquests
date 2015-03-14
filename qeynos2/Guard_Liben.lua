function event_combat(e)
  if(e.joined == true) then
    e.self:Say(string.format("Time to die %s!",e.other:GetCleanName()));
  end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello there. %s.  Guard Liben at your service.  You can walk the streets of Qeynos and feel safe knowing that we guards are here to protect you.  Just be careful not to fall in with the [wrong crowd].",e.other:GetName()));
	elseif(e.message:findi("wrong crowd")) then
		e.self:Say("Oh you know. the Circle.  The Circle of Unseen Hands is what they call themselves.  They are a bunch of thieves and murderers.  Just stay clear of them. if you know what's good for you.");
	end
end
