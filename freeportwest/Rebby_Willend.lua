-- items: 18923, 13158
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hey friend. nice wallet ya got there.  Bet it's fulla money. huh?  Why don't ya let me take a quick look. huh?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18923})) then
		e.other:SummonItem(13158); -- Item: Rebby's Rat Whiskers
		e.other:Ding();
		e.other:AddEXP(50);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Rebby_Willend