-- items: 18823, 15288
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18823})) then -- Note to Neclo
		e.self:Say("Ah.. Hello friend.. So, I see Daenor sent you.. Uh huh, ok.. Here's something that will be very useful for you. Practice this well, friend.. It will help protect you in this harsh world.");
		e.other:SummonItem(15288); -- Item: Spell: Minor Shielding
		e.other:Ding();
		e.other:Faction(342,10,0); -- Order of Three
		e.other:Faction(221,-10,0); -- Bloodsabers
		e.other:Faction(262,10,0); -- Guards of Qeynos
		e.other:Faction(296,-10,0); -- Opal Dark Briar
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
