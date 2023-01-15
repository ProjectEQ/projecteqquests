-- items: 13713, 10018, 10320
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
		e.other:SummonItem(eq.ChooseRandom(10018,10018,10320)); -- Item(s): Hematite (10018), Hematite (10018), Golden Ear Stud (10320)
		e.other:Ding();
		e.other:Faction(262,5,0); -- Faction: Guards of Qeynos
		e.other:Faction(219,5,0); -- Faction: Antonius Bayle
		e.other:Faction(230,-5,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(223,-5,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,5,0); -- Faction: Merchants of Qeynos
		e.other:GiveCash(0,4,0,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
