-- items: 12184, 12183
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What are you doing here?!! Get out before you find yourself mining for these wretched beasts!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12184})) then
		e.self:Say("You were sent by Geeda!! Here. Take the information. Maybe next you shall earn your [Scout Blade] from Laren. Quickly!! Leave at once!!");
		e.other:SummonItem(12183); -- Crushbone Information
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF Kelynn