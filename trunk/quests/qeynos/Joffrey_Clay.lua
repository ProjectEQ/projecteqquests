function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, friend. My name is Joffrey. I'm trying to learn to play the [flute]. I'm also working on a new song I learned while I was visiting [Kelethin].");
	elseif(e.message:findi("kelethin")) then
		e.self:Say("I just got back from a trip to Faydwer. I was over there studying the lore of Tunare, in the beautiful elven city of Kelethin. I highly recommend visiting there as soon as you get a chance.");
	end
end

function event_waypoint_arrive(e)
	if(e.wp == 1) then
		e.self:Say("Belious, I'm working on this new tune I learned on my last trip to Kelethin. It's about Tunare. If you have a free ear, would you care to take a listen?");
		eq.signal(1125,1);
	elseif(e.wp == 2) then
		e.self:Say("Ahem. Tunare and the Pact, sung by Joffrey Clay.");
		e.self:DoAnim(58);
		e.self:Say("La da di, la di da.. la da di. la di da..");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1131 -- Joffrey_Clay