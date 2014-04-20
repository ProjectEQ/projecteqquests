function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18774) == true) then
		e.other:Message(15,"A wise looking gnome stands before you. 'Welcome to the Library Mechanimagica young apprentice. I am Tobon Starpyre. Read the note in your inventory and give it to me so that we may begin your training'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is good to see the young show an interest in the ways of magic. Its circles can be used in tandem with our unique ways of tinkering. Have you [joined the Eldritch Collective] or are you [merely curious]?");
	elseif(e.message:findi("joined the Eldritch Collective")) then
		e.self:Say("Very good. Would you like to [go on a little mission] or are you busy studying?");
	elseif(e.message:findi("merely curious")) then
		e.self:Say("Please look around. We have much knowledge within these halls. May you soon find your place among our members. Good day.");
	elseif(e.message:findi("go on a little mission")) then
		e.self:Say("Fabulous! Here is a list of the observers outside of Ak'Anon. Go and ask each for a [spare telescope lens]. Each should give you one. We have need of them. I await your return as does your reward, either Fire Bolt or Fingers of Fire. Meant for a skilled wizard of the eighth trial.");
		e.other:SummonItem(18868); 	-- Observer List
		e.other:Ding();
	elseif(e.message:findi("yendar")) then
		e.self:Say("Oh, he is my older brother. Used to be the leader of the Eldritch Collective. Then he founded the Observers, a pretty good piece of work. Went off his rocker a long while back, though. Became obsessed with Innoruuk and the Teir'Dal. Stays away for days at a time, nobody knows where he has been. Mother still worries about him, asked me to keep an eye on him. But he is a grown gnome, and with his mastery of the art, has little to fear in this world or others. But if you are seeking him, I would look outside Ak'Anon, in the Steamfonts. That is where he makes his home these days.");
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
	if(item_lib.check_turn_in(e.trade, {item1 = 18774})) then -- Registration Letter
		e.self:Say("Ah.. Welcome, friend! I am Tobon Starpyre, Master Wizard of Library Mechanimagica. This is our tunic - wear it with pride. Study hard, master your skills, and make us proud. Once you are ready to begin your training please make sure that you see Xalirilan, he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13523);	-- Soot Stained Gold Robe*
		e.other:Faction(91,100,0); 	-- eldritch collective
		e.other:Faction(71,-15,0); 	-- Dark reflection
		e.other:Faction(322,-5,0);	-- the dead
		e.other:Faction(115,15,0); 	-- gem choppers
		e.other:Faction(176,15,0); 	-- king ak'anon
		e.other:Ding();
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13275, item2 = 13276, item3 = 13277, item4 = 13279})) then
		e.self:Say("Thank you for your work. I heard news of the troubles you encountered. Besides these troubles you still completed your mission. We are grateful. And as I once stated, your reward awaits.");
		e.other:SummonItem(eq.ChooseRandom(15380,15477,15656));
		e.other:Ding();
		e.other:AddEXP(500);
		e.other:GiveCash(0,0,0,1);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
