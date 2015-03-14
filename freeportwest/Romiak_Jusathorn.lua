function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18741) == true) then
		e.other:Message(15,"A noble Aviak stands before you. 'Hello there. Welcome. I assume you are here to train in the ways of the Enchanter. If so, please read the note in your inventory and hand it to me when you wish to start your training. Soon you will see that all you know is but an illusion.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Those fools! I can't believe they ran off with it. They have no idea what power lies within that [chest].");
	elseif(e.message:findi("chest")) then
		e.self:Say("My lockbox full of powerful spell scrolls and magical artifacts. They've been passed down in my family through the ages, and now they're gone. If used incorrectly they could. . . Oh my, I don't even want to think about it! This is terrible. . . Just, just terrible. I couldn't possibly expect anyone to help me [find] it.");
	elseif(e.message:findi("find")) then -- this starts a shared task (instance) - "The Ooze News" which will need to be implement later.
		e.self:Say("You would do that for me? I don't know how I would ever be able to repay you. Do what you like with the contents; just return to me my Vial of Desolution. That little guy almost wiped out all of Ak'Anon years back. Use any of the other contents to your liking if you deem it prudent to your success. Most of the potions you may find are simply novelty, but could prove to be useful.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18741})) then -- A tattered note
		e.self:Say("Greetings, I am Romiak Jusathorn, Master Enchanter of the Academy. Take this.. it's our guild robe; it will help protect you in this harsh environment. Once you are ready to begin your training please make sure that you see Shana Liskia, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13560); -- Old Violet Robe
		e.other:Ding();
		e.other:Faction(11,100,0); -- Arcane Scientists
		e.other:Faction(184,25,0); -- Knights of Truth
		e.other:Faction(235,-15,0); -- Opal Dark Briar
		e.other:Faction(105,-15,0); -- The Freeport Militia
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freeportwest -- Romiak_Jusathorn