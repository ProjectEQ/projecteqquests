function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. It is good to meet you. Try not to scare the fish away. This is A good spot I supply fish to the Grub N' Grog. The patrons there love me!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13922})) then -- Snapped Pole
		e.self:Say("Great! Thank you stranger. The rogues must have broken it. At least I could repair it. It would be seasons before I could afford another pole.");
		e.other:Ding();
		e.other:Faction(105,1,0); -- Freeport Militia
		e.other:Faction(48,1,0); -- Coalition of Tradefolk Underground
		e.other:Faction(184,-1,0); -- Knights of Truth
		e.other:Faction(258,-1,0); -- Priests of Marr
		e.other:AddEXP(100);
		e.other:GiveCash(50,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Olunea_Miltin



