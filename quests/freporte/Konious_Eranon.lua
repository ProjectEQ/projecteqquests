function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings!  I am the mighty Konious Eranon, Master Enchanter, devoted follower of Innoruuk, and loyal assistant to the all-powerful Nexvok.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18856})) then -- A tattered Note
		e.self:Say("Hey, Nex, we got another sucker.. er.. volunteer, that is, to help us out around here. Here ya go friend, put this on and let's whip you into shape.");
		e.other:SummonItem(13566); -- Blood Spotted Robe*
		e.other:Ding();
		e.other:Faction(86,10,0); -- Dismal Rage
		e.other:Faction(184,-15,0); -- Knights of Truth
		e.other:Faction(235,10,0); -- Opal Dark Briar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Konious_Eranon



