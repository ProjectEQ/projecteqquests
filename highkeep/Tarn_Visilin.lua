-- items: 10790, 10791, 10086, 10087, 10019, 2355
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10790})) then -- Coin of Tash
		e.self:Say("The Coin of Tash. Very good. I have laid a basic enhancement on it - to get it further enhanced you must take the coin to Mizn N'Mar in the Library of Neriak.");
		e.other:SummonItem(10791); -- Glowing Coin of Tash
		e.other:Ding();
		e.other:Faction(5029,10,0); -- Temple of Sol Ro
		e.other:Faction(416,-10,0); -- Shadowed Men
		e.other:AddEXP(1000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10086,gold = 50})) then -- Gold x 50, Glamour Stone
		e.self:Say("Here is your stone, fully enchanted."); -- Made this text up
		e.other:Ding();
		e.other:SummonItem(10087); -- Glowing Glamour Stone
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10019})) then -- Bloodstone
		e.self:Say("I see that Sultin has sent you to me.  Very well, here are your gloves.");
		e.other:Ding();
		e.other:SummonItem(2355); -- Gleaming Gloves
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
