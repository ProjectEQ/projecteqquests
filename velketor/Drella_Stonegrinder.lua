function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am the beginning.");
	elseif(e.message:findi("beginning")) then
		e.self:Say("All things have");
		eq.signal(112031,1); -- NPC: Bjoron_Axefall
	end
end
