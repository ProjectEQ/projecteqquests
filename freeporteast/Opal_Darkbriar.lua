function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18742) == true) then
		e.other:Message(15,"You find yourself in a small, dimly lit room. A dark figure steps from the shadows and greets you. 'Welcome young apprentice. I am Opal Darkbriar your new Guild Master. I am glad you found us. Read the note in your inventory and hand it to me when you wish to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! You will have to excuse me. I have no time to talk right now and I prefer to be left alone. Please leave.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18742})) then -- A tattered note
		e.self:Say("Welcome to the Guild, here's your guild robe. Now, let's get to work. Once you are ready to begin your training please make sure that yo see Marv Onilis, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I have many things yet to teach you, from advanced combat skills to the various [trades] you may wish to become proficient in.");
		e.other:SummonItem(13562); -- Dark Stained Robe
		e.other:Ding();
		e.other:Faction(235,100,0); -- Opal Dark Briar
		e.other:Faction(86,25,0); -- Dismal Rage
		e.other:Faction(322,25,0); -- The Dead
		e.other:Faction(71,25,0); -- Dark Reflection
		e.other:Faction(21,25,0); -- Bloodsabers
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end