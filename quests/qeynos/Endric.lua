function event_say(e)
	if(e.message:findi("aqueducts")) then
		e.self:Say("Aye, the aqueducts are a horrible place. I have heard rumors of horrible [beasts] who live under the city in the water and just the other day, a child playing in the water just up and disappeared!");
	elseif(e.message:findi("beasts")) then
		e.self:Say("I know nothing of what or where they may be, just rumors, friend. However, should you foolishly choose to enter the waters to brave the possibilities and return with some evidence of the [child's] fate, I would be most appreciative.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13713})) then
		e.self:Say("Yes,  I do believe this was the child's dress.  Here, take this as your share of the reward.  Her father will be heartbroken..");
		e.other:SummonItem(eq.ChooseRandom({10018,10018,10320}));
		e.other:Ding();
		e.other:Faction(36,5,0);
		e.other:Faction(9,5,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(33,-5,0);
		e.other:Faction(217,5,0);
		e.other:GiveCash(0,4,0,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
