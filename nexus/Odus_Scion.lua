function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". I am Kendal Groetan. I am here to assist and watch over those who wish to return to the continent of Odus.  A voice will shout throughout the zone informing you of when the [teleports] will become active. When you are told, proceed onto the pad and await teleportation.");
    elseif e.message:findi("teleports") then
		e.self:Say("The teleports become active approximately four times an hour. Most of the time, you can catch them midcycle, reducing your wait time. When told to, walk onto the pad and you will be teleported.");
	end
end
