-- items: 13071
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("I really can't believe it, %s. I have seen Qeynos in bad shape but this is unbelievable! The rodents have practically taken over our city. If you see some of them running around, keep the rat whiskers, and I will reward you for every four you bring me.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13071,item2 = 13071,item3 = 13071,item4 = 13071})) then
		e.self:Say(string.format("Here is something for you, %s. I certainly appreciate your help with our pest problem here. Great work.",e.other:GetName()));
		e.other:Ding();
		e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
		e.other:Faction(219,5,0); -- Faction: Antonius Bayle
		e.other:Faction(230,-5,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(223,-5,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,5,0); -- Faction: Merchants of Qeynos
		e.other:AddEXP(50);
		e.other:GiveCash(0,4,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
