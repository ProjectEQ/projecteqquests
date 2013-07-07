function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, thirsty adventurer! Please help yourself to the free salty snacks. We are here to serve you at the Lion's Main Tavern. Allow yourself to indulge from our wide selection oof fine spirits.");
	elseif(e.message:findi("kwint sent")) then
		e.self:Say("Kwint? Gave you the line about being my brother, huh? That boy sends me more customers, I tells ya! I give him one free drink for every person he gets to come in. Hey, could you do me a favor and take this voucher to him when you are done drinking? Thanks.");
		e.other:SummonItem(18821);
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18821})) then
		e.self:Say("What the..? This voucher was for Kwint, not you! I will find someone more trustworthy to take it to him.");
		e.other:Ding();
		e.other:Faction(217,-10,0);
		e.other:Faction(33,5,0);
		e.other:Faction(9,-10,0);
		e.other:Faction(47,-10,0);
		e.other:Faction(135,-10,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
