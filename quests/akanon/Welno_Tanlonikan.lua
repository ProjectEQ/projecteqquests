function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18776) == true) then
		e.other:Message(15,"A voice echoes throughout the room as you take in your surroundings. 'Hey you! This is Welno Tanlonikan. Remember me? Read the note in your inventory and then hand it to me. Hurry up! We don't have all day! You owe me a lot of money!'");
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
	if(item_lib.check_turn_in(e.trade, {item1 = 18776})) then -- Note
		e.self:Say("Yes, I just knew you'd see it my way, " .. e.other:GetName() .. ". Anyway, welcome to our little part of Ak'Anon's underworld. We have to pay a high price to keep our small orgainzation hidden, which keeps us all busy around here. Now throw this on, and let's put you to work. Once you are ready to begin your training please make sure that you come back to see me after collecting your initial supplies! I have many things to teach you that you would benefit from, from furthering your knowledge of our arts, to the various [trades] you will have available to you.");
		e.other:SummonItem(13519);	-- Scuffed Tunic*
		e.other:Ding();
		e.other:Faction(76,10); 	-- Deep Muses
		e.other:Faction(210,10); 	-- Merchants of Ak'Anon
		e.other:Faction(115,10); 	-- Gem Choppers
		e.other:Faction(71,-15); 	-- Dark Reflection
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
