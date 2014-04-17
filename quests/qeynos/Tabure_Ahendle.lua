function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18707) == true) then
		e.other:Message(15,"A deep voice breaks the silence as you attempt to get your bearings. 'Come young recruit, I sense your apprehension. You will never make an adequate warrior with fear clouding your mind. I am Tabure Ahendle, Guild Master for the Steel Warriors. Read the note in your inventory and then hand it to me to begin your training.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!");
	elseif(e.message:findi("steel warrior")) then
		e.self:Say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild.");
	elseif(e.message:findi("dangerous task")) then
		e.self:Say("A ship sank while returning from Odus. On this ship was my squire, Tombor. He sank to the bottom and there he still lies. With him went a map. I would very much like you to search for this sunken ship. Return the map to me. I am sure it is still in the rotting hands of Tombor.");
	elseif(e.message:findi("assist")) then
		e.self:Say("So, you think you be of assistance to me? Let me test your skill. Travel to Erudin and seek out the beasts which are called Kobolds. I have never seen one and would very much like to have four Kobold Hides with which to make a rug. To do so would earn you some barely used rawhide armor - maybe even a shield.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18707})) then -- Recruitment Flyer
		e.self:Say("Welcome to the Hall of Steel, our swords are strong, and our warriors stronger. Here is our guild tunic. Brin Stolunger is in charge of our new recruits. Go see him, and he'll teach the basics. You look like you'll make a fine addition to our guild. Once you are ready to pave your path to glory return to me for some initial armor quests. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13572); -- Dirty Training Tunic*
		e.other:Ding();
		e.other:Faction(311,100,0); -- Steel Warriors
		e.other:Faction(135,20,0); -- Guard of Qeynos
		e.other:Faction(53,-15,0); -- Corrupted Qeynos Guard
		e.other:Faction(105,-15,0); -- The Freeport Militia
		e.other:Faction(184,20,0); -- Knight of Truth
		e.other:AddEXP(100);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13423})) then
		e.self:Say("The map!! It is all blurred. The ink has run. I shall never be able to decipher it now. Still, I owe you for completion of your mission. May these be of assistance. It is always good for a warrior to be well supplied.");
		e.other:SummonItem(5082);
		e.other:Ding();
		e.other:Faction(135,1,0);
		e.other:Faction(184,1,0);
		e.other:Faction(311,1,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(105,-5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,3,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13424, item2 =13424, item3 = 13424,item4 = 13424})) then
		e.self:Say("Incredible!! Such grand tones. It shall make a fine rug. You have shown me that you cannot always judge a book by its cover. You are quite skilled. Would you like to perform a [dangerous task] for me?");
		e.other:SummonItem(eq.ChooseRandom(2112, 2106, 2111, 2108, 2104));
		e.other:Ding();
		e.other:Faction(135,1,0);
		e.other:Faction(184,1,0);
		e.other:Faction(311,1,0);
		e.other:Faction(53,-5,0);
		e.other:Faction(105,-5,0);
		e.other:AddEXP(500);
		e.other:GiveCash(0,4,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle