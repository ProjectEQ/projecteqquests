-- items: 13903, 18722
local proof = 0;

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You'd better run along, if ya know what's best for ya!");
	elseif(e.message:findi("lovely night for a stroll")) then
		e.self:Say("Yes, it is a lovely night for a walk, especially with a good friend. Tell me, are you a [friend]?");
		proof = 1;
	elseif(e.message:findi("friend") and proof == 1) then
		e.self:Say("My memory is a bit fuzzy. If you are a friend, prove it to me.");
		proof = 2;
	end
end	

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13903}) and proof == 2) then -- Bent Card
        proof = 0;
		e.self:Say("");
		e.other:SummonItem(18722); --Sealed Note For Knargon 
		e.other:Ding();
		e.other:Faction(329,5,0); -- Carson McCabe
		e.other:Faction(336,5,0); -- Coalition of Tradefolk Underground
		e.other:Faction(304,-10,0); -- Ring of Scale
		e.other:Faction(332,5,0); -- Highpass Guards
		e.other:Faction(331,5,0); -- Merchants of Highpass
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
