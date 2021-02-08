function event_waypoint_arrive(e)
	if(e.wp == 2) then
		e.self:SetAppearance(4);
		e.self:Say("Ah hah! Here it is! Let's see here... Yes, I remember now. This here has a recordin' o Burdael's tale. I'll lend ya the book, but it'll cost ya 50 platinum.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {platinum = 50}, 0)) then
		e.self:Emote("pockets the change and hands you the book. He says, 'Be careful with that now, it's very old. If it comes back all ripped up, ye owe me a beer.'");
		e.other:QuestReward(e.self,0,0,0,0,18237,1000); -- Worn Coldain Tome
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
