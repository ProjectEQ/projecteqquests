function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 8723})) then
		e.self:Emote("begins to cast a spell. Gimlik says, 'Well, you've got a good eye on you for being so daft. Thank you for returning my quill. Take care!' Gimlik gates.");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
