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
		e.other:Faction(135,5,0);
		e.other:Faction(9,5,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(33,-5,0);
		e.other:Faction(217,5,0);
		e.other:AddEXP(50);
		e.other:GiveCash(0,4,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
