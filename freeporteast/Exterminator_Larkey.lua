-- items: 13071
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello there %s, I hope you are doing well on this fine day. I would be great myself if it wasn't for these darn Rodents, they are everywhere! I don't suppose you would be able to help us with our problem? I would be glad to reward you for every four rat whiskers you can bring me.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13071,item2 = 13071,item3 = 13071,item4 = 13071})) then
		e.self:Say(string.format("I knew I could count on you %s, here is a little something for you.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(330,10,0); -- Faction: The Freeport Militia
		e.other:Faction(336,10,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(281,-10,0); -- Faction: Knights of Truth
		e.other:Faction(362,-10,0); -- Faction: Priests of Marr
		e.other:AddEXP(50);
		e.other:GiveCash(1,1,1,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
