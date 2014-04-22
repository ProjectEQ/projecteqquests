function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18777)) then
		e.other:Message(15,"As you enter what seems to be a small bedroom, a beautiful High Elf woman looks your way. 'Hello. You have come for training in the ways of the Keepers of the Art? Very good. Please read the note in your inventory and when you are ready to begin, hand it to me.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, " .. e.other:GetName() .. ". Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to [fetch] some for me?");
	elseif(e.message:findi("fetch")) then
		e.self:Say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 13068,item2 = 13068,item3 = 13068,item4 = 13068})) then
		e.self:Say("Ah yes.  These are exactly what I need.  Thank you very much.");
		e.other:SummonItem(eq.ChooseRandom(15310,15332));
		e.other:Ding();
		e.other:Faction(170,5,0);
		e.other:Faction(178,5,0);
		e.other:Faction(99,5,0);
		e.other:Faction(322,-10,0);
		e.other:AddEXP(350);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18777})) then -- Enrollment Letter
		e.self:Say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild tunic. Once you are ready to begin your training please make sure that you see Yuin Starchaser, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13592); -- Faded Training Robe*
		e.other:Ding();
		e.other:Faction(170,100,0); -- Keepers of the Art
		e.other:Faction(178,25,0); -- King Tearis Thex
		e.other:Faction(99,15,0); -- Faydark's Champions
		e.other:Faction(322,-25,0); -- The Dead
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18902})) then
		e.self:Say("She is still alive? OH, thank you for this news.");
		e.other:SummonItem(1307);
		e.other:Ding();
		e.other:AddEXP(30000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder