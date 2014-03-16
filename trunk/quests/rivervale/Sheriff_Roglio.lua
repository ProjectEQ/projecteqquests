function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18733)) then
		e.other:Message(15,"As your eyes adjust to the interior of your surroundings, you see Mayor Gubbin and Sheriff Roglio standing nearby. The Mayor turns towards Sheriff Roglio. 'Looks like we have another fine young recruit to join your ranks, Roglio!' Sheriff Roglio looks your way. 'Greetings, recruit. Read the note in your inventory and hand it to me when you wish to start your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, " .. e.other:GetName() .. "! Stand tall whenever you are speaking to the Sheriff of Rivervale. I command the warriors of this vale. You must be new to the ranks of the Guardians of the Vale, so be sure to report to your squad at once. We must protect our people. The [danger] has come closer to home. If you are not a deputy, then please leave these halls.");
	elseif(e.message:findi("danger")) then
		e.self:Say("What danger?!! You must be new to the community. The goblins of Clan Runnyeye have been scaling our wall somehow. You must join our forces in exterminating every one of those beasts. Your wages are earned with every four bloody goblin warbead necklaces you return to me. Now be off and fight the good fight.");
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18733})) then -- Hand in Warrior Recuitment Letter
		e.self:Say("Welcome to the Guardians of the Vale. I'm Roglio Bruth, and I run this proud little outfit. You seem to be of hearty stock, let's put you to work. Here's your guild tunic - hope it fits. Start your training right away. Once you are ready to begin please make sure that you see Dalario Blistbobble, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13540); -- Old Tan Tunic
		e.other:Ding();
		e.other:Faction(133, 10,0); -- Gaurdians of the Vale
		e.other:Faction(208, 10,0); -- Mayor Gubbin
		e.other:Faction(316, 10,0); -- Storm Reapers
		e.other:Faction(218, 10,0); -- Merchants of Rivervale
		e.other:Faction(88,-15,0); -- Dreadguard Outer
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13931,item2 = 13931,item3 = 13931,item4 = 13931})) then -- Hand in Runnyeye Warbeads
		e.self:Say("Good work, Deputy " .. e.other:GetName() .. "! We shall soon rid our countryside of the goblin threat. Here are your wages. Eat well tonight!");
		e.other:SummonItem(13023); -- Bixie Berry Buns
		e.other:SummonItem(13024); -- Tanglefoot Tingle Drink
		e.other:Ding();
		e.other:Faction(133, 1,0); -- Gaurdians of the Vale
		e.other:Faction(208, 1,0); -- Mayor Gubbin
		e.other:Faction(316, 1,0); -- Storm Reapers
		e.other:Faction(218, 1,0); -- Merchants of Rivervale
		e.other:Faction(88,-1,0); -- Dreadguard Outer
		e.other:AddEXP(6400);
		e.other:GiveCash(0,8,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End of File, Zone:rivervale  NPC:19058 -- Sheriff_Roglio
