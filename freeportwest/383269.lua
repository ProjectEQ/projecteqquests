-- Orc hand-in NPC for Final Task Rogue
-- items: 19930, 19918

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19930})) then
		e.self:Say("Arg");
		e.other:SummonItem(19918); -- Item: Rough Blue Gem
		e.other:Ding();
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
