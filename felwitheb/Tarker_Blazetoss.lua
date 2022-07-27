-- items: 51121, 51122, 18779, 13594, 13758, 7007, 13009, 58094, 59964, 6012
function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18779)) then
		e.other:Message(15,"As you get your bearings, Tarker Blazetoss, an important looking High Elf turns to greet you. 'Welcome young wizard. I am guild Master Tarker Blazetoss. Read the note in your inventory and once you are ready to begin your training, hand me your note. I welcome you to our crusade against evil.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and well met, " .. e.other:GetName() .. "!  Have you come to study. or can you [perform a task] for me this day?");
	elseif(e.message:findi("perform a task")) then
		e.self:Say("That is the spirit.  There are many black wolves wandering Faydark these days.  One of my brethren needs a black wolf skin as a component for his magic.  Bring me a black wolf skin. and I shall reward you for your efforts."); 
	elseif(e.message:findi("trades")) then
		e.self:Say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		e.other:SummonItem(51121); -- Item: Tradeskill Basics : Volume I
	elseif(e.message:findi("second book")) then
		e.self:Say("Here is the second volume of the book you requested, may it serve you well!");
		e.other:SummonItem(51122); -- Item: Tradeskill Basics : Volume II
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18779})) then -- Enrollment Letter
		e.self:Say("Welcome to the wizards' guild of the Keepers of the Art. My name's Tarker, and I run this guild. You've got a lot of training ahead of you, so let's get started. Here, take this - it's our guild tunic. Wear it with honor, friend. Once you are ready to begin your training please make sure that you see Yuin Starchaser, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13594); -- Singed Training Robe*
		e.other:Ding();
		e.other:Faction(275,100,0); -- Keepers of the Art
		e.other:Faction(279,25,0); -- King Tearis Thex
		e.other:Faction(246,15,0); -- Faydark's Champions
		e.other:Faction(239,-25,0); -- The Dead
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13758})) then
		e.self:Say("Ah yes.  This is exactly what I need.  Thank you very much.");
		e.other:SummonItem(eq.ChooseRandom(7007,13009,58094,59964,6012)); -- Item(s): Rusty Dagger (7007), Bandages (13009), Simple Copper Ring (58094), Spell: Numbing Cold (59964), Worn Great Staff (6012)
		e.other:Ding();
		e.other:Faction(275,10,0); -- Keepers of the Art
		e.other:Faction(279,10,0); -- King Tearis Thex
		e.other:Faction(246,10,0); -- Faydark's Champions
		e.other:Faction(239,-10,0); -- The Dead
		e.other:AddEXP(350);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:felwitheb  ID:62019 -- Tarker_Blazetoss
