function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Heya.. If you see anything you like, I'm sure we can make a deal.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Um, just fine, Knargon. What do you want now, huh?");
		eq.signal(2072,1); -- NPC: Knargon_Lanenda Rogue Guildmaster
	elseif(e.signal == 2) then
		e.self:Say("How about you go, and I'll catch up with you... never?");
	end
end
