--[[Zone: Plane of Mischief
#Zone ID: 126
#NPC Name: Bob the Painter]]

function event_trade(e)
	local item_lib = require("items");
	
	if item_lib.check_turn_in(e.trade, {item1 = 18008}) then -- Item: Check for Words of Wealth (Combined)
		e.other:QuestReward(e.self,0,0,0,0,17326,100);  -- Item: Pot of Gold
		e.self:QuestSay(e.other, "Ay!!! this is poifect! 'ere take this pot o' gold. It's empty at the moment. Go ask my brother Vinny about the pot and mebbe he'll have a clue how ta get it full agin.");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

