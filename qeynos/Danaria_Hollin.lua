function event_waypoint_arrive(e)
	if(e.wp == 5) then
		e.self:Say("I would like an Erudian tart, please.");
		eq.signal(1110,1); -- NPC: Karn_Tassen Baking Supplies
	elseif(e.wp == 8) then
		e.self:Say("Time in the pub shall keep them from advancing to the next level of the mind. When will they learn?");
	elseif(e.wp == 26) then
		e.self:Say("A magnificent piece of workmanship! The clock, too.");
	end
end

function event_signal(e)
	e.self:Say("Just get me the tart and put your eyes back in your sockets or I'll pry them out for good!");
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! Nice to meet someone with manners. I do not see how you people stand to live in this madhouse of ruffians. I would have left weeks ago if I were not waiting for a delivery. Oh, well. Nice to have met you.");
	elseif(e.message:findi("delivery")) then
		e.self:Say("I am in Qeynos to meet up with a fellow Erudite coming from Freeport. He is two weeks late and I fear the worst. I shall need to hire some lackey to go to Freeport to find him.");
	elseif(e.message:findi("find him")) then
		e.self:Say("Yes, that might work. Please go to Freeport and find him. His name is Palatos Kynarn. Tell him that Danaria has sent you for the painting. And be quick about it! Thank you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end