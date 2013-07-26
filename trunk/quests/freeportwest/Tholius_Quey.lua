function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18736) == true) then
		e.other:Message(15,"As you bask in the majesty of the Temple of Marr, an important looking individual, clad in shining metal armor turns to greet you. 'I can spot a new recruit a mile away. Welcome to the Temple of Marr. I am Tholius Quey. Read the note in your inventory and hand it to me to begin your training. I wish you the best of luck.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Welcome %s! This is the Temple of Marr and you must be another seeker of passion and valor. That is good. Become one with us and help us to defeat the [fallen knight]. It is he who has caused the demise of this city.",e.other:GetName()));
	elseif(e.message:findi("knight")) then
		e.self:Say("The fallen knight I speak of is none other than Sir Lucan D'Lere. The self proclaimed ruler of this city. He is no ruler and he never was no true Knight of Truth. If it were not for the [Crusade of Tears] this city would still be united in valor.");
	elseif(e.message:findi("crusade")) then
		e.self:Say("In the year of thirty one hundred fifty. the Knights of Truth were called upon by the twin gods Erollisi and Mithaniel Marr. They instructed us to go forth across the Ocean of Tears and across the lands of Faydwer and purge the lands of the undead. It was during this crusade Freeport was left in the care of Sir Lucan D'Lere. How unfortunate.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18736})) then
		e.self:Say("Welcome to the Priests of Marr. Here, you will be taught how powerful passion truly is. The passion of Erollisi Marr, the Queen of Love, shall flow through you and into all those you meet. Wear this tunic in the name of Love. Once you are ready to begin your training please make sure that yo see Salinsa Delfdosan, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13556);
		e.other:Ding();
		e.other:Faction(258,10,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,10,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
