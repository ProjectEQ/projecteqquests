-- items: 13099, 12247, 10307, 15338, 13073, 13927, 15331
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("A new recruit to our cause.  Just what I have been waiting for!  How would you like to serve the great Xelha Nevagon?  I need an apprentice necromancer to [assist the great Xelha].");
	elseif(e.message:findi("assist the great xelha")) then
		e.self:Say("Fantastic.  Stick with me and you shall ascend in our ranks quickly.  I am in need of some components for new spells.  Will you collect them for me?  I shall need four each of the following - fire beetle eyes. bone chips and spiderling silk.  Fetch these items for me at once. Well..? Did not you hear the great Xelha? Begone!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13099, item2 = 13099, item3 = 13099, item4 = 13099})) then -- Spiderling Silk
		e.self:Say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Xelha's Sparkler. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
		e.other:SummonItem(12247); -- Xelha's Sparkler
		e.other:Ding();
		e.other:Faction(271,1,0); -- Dismal Rage
		e.other:Faction(281,-1,0); -- Knights of Truth
		e.other:Faction(296,1,0); -- Opal Dark Briar
		e.other:AddEXP(250);
		e.other:GiveCash(0,4,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10307, item2 = 10307, item3 = 10307, item4 = 10307})) then -- Fire Beetle Eye
		e.self:Say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well. I give you Spell: Cavorting Bones. It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
		e.other:SummonItem(15338); -- Item: Spell: Cavorting Bones
		e.other:Ding();
		e.other:Faction(271,1,0); -- Dismal Rage
		e.other:Faction(281,-1,0); -- Knights of Truth
		e.other:Faction(296,1,0); -- Opal Dark Briar
		e.other:AddEXP(250);
		e.other:GiveCash(8,1,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13073, item2 = 13073, item3 = 13073, item4 = 13073})) then -- Bone Chips
		e.self:Say("Let's see here. One.. two.. three.. and.. four. Great!! Just enough for my needs. You are serving Xelha well.  It is not much, but neither are you. You know what I really need is a cyclops eye. That would be worthy of a great reward.");
		e.other:Ding();
		e.other:Faction(271,1,0); -- Dismal Rage
		e.other:Faction(281,-1,0); -- Knights of Truth
		e.other:Faction(296,1,0); -- Opal Dark Briar
		e.other:AddEXP(250);
		e.other:GiveCash(0,4,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13927})) then -- Cyclops Eye
		e.self:Say("A cyclops eye!! You are stronger than I believed. You will rise in the ranks of the Dismal Rage quickly with acts such as this!! I am most appreciative! Here, take this. It was lying around my shelves, just gettingg all dusty. I hope you can use it. And watch yourself in your journeys, the aura of your faith in Innoruuk surrounds you like a shroud. Our enemies will surely see you for what you are.");
		e.other:SummonItem(15331); -- Item: Spell: Reclaim Energy
		e.other:Ding();
		e.other:Faction(271,1,0); -- Dismal Rage
		e.other:Faction(281,-1,0); -- Knights of Truth
		e.other:Faction(296,1,0); -- Opal Dark Briar
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freporte -- Xelha_Nevagon.pl


