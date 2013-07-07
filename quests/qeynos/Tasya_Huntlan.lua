function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s!  Are you just visiting Qeynos?  We have plenty of rooms available or, if your throat is parched, you can always visit Earron in our pub.",e.other:GetName()));
	end
end

function event_signal(e)
	if(e.signal == 2) then
		e.self:Say("Yes.  He is staying here at the Lion's Mane Inn, but it is against regulations to give out room numbers.  I can tell you that he loves to see the sun rise over the ocean.");
	end
end
