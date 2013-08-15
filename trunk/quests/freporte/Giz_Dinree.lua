function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Excuse me! I came here in hopes of being alone!");
	elseif(e.message:findi("sent by tani")) then
		e.self:Say("You're a new rogue, then! Your mission is to kill the young daughter of the owner of the Seafarer's Roost. Wait for the right time. Why? You don't need to know. Do it and return Lyda's head to Tani in Neriak. I hope you can make it back to Neriak alive. Good hunting!");
	end
end
