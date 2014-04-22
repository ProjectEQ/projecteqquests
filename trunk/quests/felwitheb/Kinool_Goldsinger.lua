function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18778)) then
		e.other:Message(15,"You enter a dimly lit room. In the center of the room, an important looking High Elf stands on a platform. He turns to greet you. 'Welcome young apprentice. I am Kinool Goldsinger, Guild Master of the Enchanters' guild here in Felwithe. Please read teh note in your inventory and when you are ready to begin your training, hand it to me.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail and welcome.  I am sure you have much to do, but could I ask a [favor] of you?");
	elseif(e.message:findi("favor")) then
		e.self:Say("Oh, um, on second thought, never mind.  I should really just do it myself.  Thank you anyway."); 
	elseif(e.message:findi("enchanted bow")) then
  		e.self:Say("Alas... Another ranger in search of the [Rain Caller]. She is no more");
	elseif(e.message:findi("rain caller")) then
  		e.self:Say("Rain Caller is the name we give each Trueshot longbow once it is enchanted. Unfortunately, I am unable to enchant them any longer. One of the components is no longer available. Someone would have to strike a [deal with the fairie folk]. Once I have that and the [remaining components] I can create the Rain Caller, a ranger's bow");
	elseif(e.message:findi("fairie folk")) then
  		e.self:Say("The fairie princess, Joleena, used to have a metal gnome deliver [fairie gold dust] to the Keepers every month. She has stopped this and now refuses to offer it to any nation of Faydwer. What she is angry about, we do not know.");
	elseif(e.message:findi("gold dust")) then
 	 	e.self:Say("Fairie gold dust is an enchanted powder which only a fairie princess can create.");
	elseif(e.message:findi("remaining component")) then
  		e.self:Say("The remaining components are the Trueshot longbow and a treant heart. There will also be the guild donation in the amount of 3000 gold coins. These and the [fairie gold dust] will merit a ranger the Rain Caller enchanted bow.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18778})) then -- Enrollment Letter
		e.self:Say("Greetings and welcome aboard!  My name's Kinool. Master Enchanter of the Keepers of the Art.  Here is your guild tunic. Make us proud, young pupil! Once you are ready to begin your training please make sure that you see Yuin Starchaser, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13593); -- Torn Training Robe*
		e.other:Ding();
		e.other:Faction(170,100,0); -- Keepers of the Art
		e.other:Faction(178,25,0); -- King Tearis Thex
		e.other:Faction(99,15,0); -- Faydark's Champions
		e.other:Faction(322,-25,0); -- The Dead
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12333,item2 = 12334,item3 = 8401, gold = 3000})) then
  		e.self:Say("Fine work!! I now reward you with The Rain Caller.");
		e.other:Ding();
  		e.other:AddEXP(5000);
  		e.other:SummonItem(8402);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:felwitheb  ID:62020 -- Kinool_Goldsinger 

