function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18735) == true) then
		e.other:Message(15,"As you bask in the majesty of the Temple of Marr, an important looking individual, clad in shining metal armor turns to greet you. 'I can spot a new recruit a mile a way. Welcome to the Temple of Marr. I am Eastyana Naestra. Read the note in your inventory and hand it to me to begin your training. I wish you the best of luck.'");
	end
end


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith.");
	elseif(e.message:findi("militia")) then
		e.self:Say("The Freeport Militia is nothing more than a ragtag band of mercenaries and convicts. They act as the guards of this troubled city. Be well aware that they are not the honorable guards you may think they are. They are commanded by Sir Lucan D'Lere, the self-proclaimed ruler of Freeport. We of the Hall of Truth shall set this city free from the grip of the Militia one day. It is our duty as Knights of Truth.");
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

	if(item_lib.check_turn_in(e.trade, {item1 = 18822})) then
		e.self:Say("You must be the young member of the Hall of Truth who was sent by Theron. I am glad to see you avoided any interference. Please take this as a reward for your service.");
		e.other:SummonItem(9985);
		e.other:Ding();
		e.other:Faction(184,10,0);
		e.other:Faction(86,-15,0);
		e.other:Faction(105,-15,0);
		e.other:Faction(258,10,0);
		e.other:Faction(311,10,0);
		e.other:AddEXP(500);
		e.other:GiveCash(9,0,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18804})) then
		e.self:Say("Thank you, defender of Karana! We have heard rumors of the followers of Bertoxxulous gaining knowledge of our knight who infiltrated the ranks of the [Militia]. They would have tried to sell the information to the Militia. We will inform our knight immediately. As for you, here is a donation to your journey's expenses. Stay clear of the Freeport Militia. There is no doubt they have learned of your alliance with us.");
		e.other:SummonItem(eq.ChooseRandom(6016,13296));
		e.other:Ding();
		e.other:Faction(184,10,0);
		e.other:Faction(86,-15,0);
		e.other:Faction(105,-15,0);
		e.other:Faction(258,10,0);
		e.other:Faction(311,10,0);
		e.other:AddEXP(1000);
		e.other:GiveCash(0,0,7,1);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18735})) then -- Tattered Note
		e.self:Say("The Truthbringer welcomes you into his life. Here is the tunic of Marr. Wear it with pride and be sure to conduct yourself with valor. Once you are ready to begin your training please make sure that yo see Salinsa Delfdosan, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		e.other:SummonItem(13554); -- Faded Purple Tunic*
		e.other:Ding();
		e.other:Faction(184,100,0); -- knight of truth
		e.other:Faction(86,-15,0); -- dismal rage
		e.other:Faction(105,-15,0); -- freeport militia
		e.other:Faction(258,20,0); -- priest of marr
		e.other:Faction(311,10,0); -- steel warrior
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
