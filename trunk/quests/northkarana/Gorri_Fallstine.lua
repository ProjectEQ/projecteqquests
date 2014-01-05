function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("I'm afraid I can't speak right now, %s.  I'm waiting for someone very important to arrive.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10307,item2 = 10307,item3 = 10307,item4 = 10307}) or 
	item_lib.check_turn_in(e.trade, {item1 = 10307,item2 = 10307,item3 = 10307}) or 
	item_lib.check_turn_in(e.trade, {item1 = 10307,item2 = 10307}) or
	item_lib.check_turn_in(e.trade, {item1 = 10307}) ) then
		e.self:Say(string.format("Ah, yes. Thank you, %s.",e.other:GetName()));
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
