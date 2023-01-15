-- Converted to .lua by Speedz
-- items: 13077, 13271, 12160, 15205, 15211, 15288, 15310, 15311, 15313, 15331, 15050, 15093, 15315, 15316, 15058, 15317, 15318, 15036, 15094, 15246, 15322, 15323, 15325, 15851, 15324, 15332, 15400, 15399, 15398, 15042, 15613, 13272

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! Welcome to the Library of Mechanimagica. You must be a [current member of the Library] or has my [mind begun to slip]?");
	elseif(e.message:findi("mind")) then
		e.self:Say("What!!? That was but a joke. I try to make you feel comfortable with a little levity and you proclaim my mind has gone the way of Meldrath's. Well.. enough frivolity. You will do your part to help in the menial tasks of the Collective. Do you want the [clean tasks] or the [dirty tasks]?");
	elseif(e.message:findi("tasks")) then
		e.self:Say("Clean.. Dirty.. It matters not. You have upset me with your rude remarks. You will go to the Steamfont Mountains. There you will find Fodin and tell him I have sent you. He will have a nice tidy task for you. A bath!! Be on your way!");
	elseif(e.message:findi("current member of the library")) then
		e.self:Say("Good. The last thing a member of the Eldritch Collective needs is to lose his mind. Look what happened to Meldrath. Enough chitchat. I am Larkon and it is not my job to teach you. It is my job to direct you to service. We require items and such to complete our studies. We need someone of moderate skill to [gather minotaur horns] and [collect basilisk tongues].");
	elseif(e.message:findi("gather minotaur horns")) then
		e.self:Say("We magicians require the horns of minotaurs. We crush them down and use the powder in many of our tests. Go and fetch two minotaur horns. Do not return empty-handed. I await your return as does your reward.");
	elseif(e.message:findi("basilisk tongues")) then
		e.self:Say("Very good of you. Go beyond the land of the gnomes and seek out basilisks. Return four of their tongues to me and I shall share the knowledge of the magicians of the Eldritch Collective.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13077, item2 = 13077})) then -- Minotaur Horn x 2
		e.self:Say("Fine work. You have earned the respect of the Library. Here is a small token of our appreciation. We shall have this ground down as soon as we find someone to go to Kaladim.");
		e.other:AddEXP(100);
		e.other:Ding();
		e.other:Faction(245,20,0); 	-- eldritch collective
		e.other:Faction(255,3,0); 	-- gem choppers
		e.other:Faction(333,1,0); 	-- king ak'anon
		e.other:Faction(238,-3,0); 	-- Dark reflection
		e.other:Faction(239,-1,0); -- the dead
		e.other:GiveCash(6,1,2,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13271})) then -- Air Tight Box
		e.self:Say("Ah! See? you weren't too afraid to get your hands dirty after all. Now go take a bath!");
		e.other:AddEXP(100);
		e.other:Ding();
		e.other:Faction(245,10,0);	-- eldritch collective
		e.other:Faction(255,1,0); 	-- gem choppers
		e.other:Faction(333,1,0); 	-- king ak'anon
		e.other:Faction(238,-1,0); 	-- Dark reflection
		e.other:Faction(239,-1,0); -- the dead
		e.other:GiveCash(6,1,2,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12160, item2 = 12160, item3 = 12160, item4 = 12160})) then -- Basilisk Tongue x 4
		e.self:Say("Very very good! I can use these in some of our experiments. These tongues are hard to come by and more than a few of our scouts have been turned to stone because of these creatures, but I'm sure you found that out by now, eh?");
		e.other:AddEXP(100);
		e.other:Ding();
		e.other:SummonItem(eq.ChooseRandom(15205,15211,15288,15310,15311,15313,15331,15050,15093,15315,15316,15058,15317,15318,15036,15094,15246,15322,15323,15325,15851,15324,15332,15400,15399,15398,15042,15613)); -- mage lvl 1-8 spells excluding pet item spells
		e.other:Faction(245,10,0); 	-- eldritch collective
		e.other:Faction(255,1,0); 	-- gem choppers
		e.other:Faction(333,1,0); 	-- king ak'anon
		e.other:Faction(238,-1,0); 	-- Dark reflection
		e.other:Faction(239,-1,0); -- the dead
		e.other:GiveCash(6,1,5,1);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13272})) then -- Bozinite Pestle
		e.self:Say("Outstanding " .. e.other:GetName() .. "!! This should be of help to you.");
		e.other:SummonItem(eq.ChooseRandom(15205,15211,15288,15310,15311,15313,15331,15050,15093,15315,15316,15058,15317,15318,15036,15094,15246,15322,15323,15325,15851,15324,15332,15400,15399,15398,15042,15613)); -- mage lvl 1-8 spells excluding pet item spells
		e.other:GiveCash(6,1,5,1);
		e.other:Ding();
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
