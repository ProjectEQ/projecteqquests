function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I am here to assist and watch over those who wish to return to the continent of Velious.  Due to the limited space I share this area with the portal to Odus.  It may be a little confusing but if you listen for the voice it will tell you when to step on the pad for Velious or Odus.  Safe travels to you.");
	end
end
