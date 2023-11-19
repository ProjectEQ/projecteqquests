-- Pepe's Got a Brand New Bag

function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I miss Lamontt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 55571}) then -- Item: Lamontt
		e.self:Say("Here tools. Hope boss not get mad.' Pepe begins to hug Lamontt.");
		e.other:QuestReward(e.self,0,0,0,0,55573,eq.ExpHelper(51)); -- Item: Scraping Tool
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
