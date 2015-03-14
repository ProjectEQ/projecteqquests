function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who are you? Did McNeal send you? If not, you would do yourself good to leave Gnasher alone. I have friends in high places.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18800})) then
		e.self:Say("Ah. Good for you! Here you are. Take this to McNeal, but next time there will be no stout if there are no weapons.");
		e.other:SummonItem(13131);
		e.other:Ding();
		e.other:Faction(33,5,0);
		e.other:Faction(217,-10,0);
		e.other:Faction(53,5,0);
		e.other:Faction(135,-10,0);
		e.other:Faction(164,5,0);
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
