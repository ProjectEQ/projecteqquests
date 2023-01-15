-- no response to hail
-- items: 29008, 29009

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 29008})) then -- bucket of water
		e.self:Emote("dips his emaciated hand into the bucket and brings the water to his mouth. As he does, you hear a soft thump from outside and notice that through the window his sister has collapsed. A glimmer enfolds her body, and you notice the water in Joshua's hand gleam a pure, bright light for a moment. 'Thank you, sir. I hope my sister returns soon. I feel better for some reason.'");
		e.other:SummonItem(29009); -- bucket of pure water
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Joshua