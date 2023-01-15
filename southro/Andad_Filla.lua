-- Zone: Southern Ro
-- Short Name: sro
-- Zone ID: 35
-- items: 20533, 20534

-- NPC Name: Andad Filla
-- NPC ID: 35030
-- Quest Status: finished
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello traveler, please do not bother me right now; I am waiting for someone.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20533})) then
		e.self:Say("You still have a ways to go! Seek out Misty Tekcihta near the arena at Lake Rathe. Run like the wind!");
		e.other:Ding();
		e.other:SummonItem(20534); -- Item: Torch of Rathe
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
