-- Test of Charm - enchanter epic - Enchanted Ruby
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10633})) then
		e.self:Say("Hisss...my spirit is forever trapped here. Leave before your fate is as mine.");
		e.other:QuestReward(e.self,{itemid = 10620}) -- Enchanted Ruby
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
