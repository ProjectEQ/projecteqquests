function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18773) == true) then
		e.other:Message(15,"A beautiful gnomish woman stands before you. 'Welcome to the Library Mechanimagica young apprentice. I am Juline Urncaller, Master Enchanter. Read the note in your inventory and then hand it to me so that we can begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121);
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18773})) then -- Registration Letter
		e.self:Say("Welcome! I am Juline Urncaller, I will help to guide you on your path to becoming a powerful enchanter. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of teh various [trades] you will have available to you. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills.");
		e.other:SummonItem(13522); 	-- Dirty Gold Felt Robe*
		e.other:Ding();
		e.other:Faction(91,100,0); 	-- eldritch collective
		e.other:Faction(71,-15,0); 	-- Dark reflection
		e.other:Faction(322,-5,0);	-- the dead
		e.other:Faction(115,15,0); 	-- gem choppers
		e.other:Faction(176,15,0); 	-- king ak'anon
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
