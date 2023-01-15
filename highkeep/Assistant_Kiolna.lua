-- items: 12143, 18936, 12193, 13323
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello! I am Jaylin's new assistant, Kiolna. If you wish to hand in your keys, please give them to me and I will be happy to assist you! It is a pleasure doing business with you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12143})) then
		e.self:Say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		e.other:SummonItem(18936); -- Item: Sealed Note
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12193})) then
		e.self:Say("I am sorry to see you check out. Here is all you had in your box. We hope to serve you again. Have a nice day!! Next!");
		e.other:SummonItem(13323); -- Item: Emerald Shard
		e.other:Ding();
		e.other:AddEXP(500);
		e.other:GiveCash(0,4,5,1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
