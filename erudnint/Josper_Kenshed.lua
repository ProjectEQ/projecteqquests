function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Come forward and speak.  What is it you seek within these walls?  Let it be the knowledge of wizardry. for that is what we are.  Only a [servant of wizardry] should be within these walls.");
	elseif(e.message:findi("servant of wizardry")) then
		e.self:Say("A servant. you say?  If you be a young apprentice. perhaps you might assist me? I could use you to [collect components].  If you believe yourself to be beyond such things. you may wish to assist me with a [special matter].");
	elseif(e.message:findi("collect component")) then
		e.self:Say("Of course you may assist me!! We have much need of a certain item which can only be found in the frigid peaks of Everfrost. There you shall find creatures called ice goblins. Take this bag and fill it with ice goblin beads and be sure to combine them before you return them. Well, then... Off with you!! And be quick about it and I shall give you a fine wizard's weapon. None of this rust-covered garbage offered by our associates!");
		e.other:SummonItem(17944);
	elseif(e.message:findi("special matter")) then
		e.self:Say("An old friend of mine can not rest till he his research is finished.  If I only know what he wsa working on. Goto the forest of Toxxulia and seek him out. Bring me back what information you can find about what he was researching before his demise.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13898})) then -- bag of ice necklaces
		e.self:Say("Well done, my young apprentice. I call you apprentice for you are nothing but a spark to my fire. This is the final component for my greatest creation. AHA!! I call it - iced tea!! Never again shall I boil under the hot sun. As for you, take this. It should serve you well. Now go away. There is no iced tea for you");
		e.other:Ding();
		e.other:SummonItem(12208);
		e.other:Faction(60,10,0); --faction with Crimson hands increased
		e.other:Faction(145,10,0); --faction with High Council of Erudin increased
		e.other:Faction(143,-30,0); --faction with Heretics decreased
		e.other:Faction(147,10,0); --faction with High Guards of Erudin increased
		e.other:AddEXP(1000);
		e.other:GiveCash(0,7,0,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12207})) then -- Ilanic's Scroll
		e.self:Say("Go now and use his research to aid yourself. Seems that I lack the will to use Ilanic's knowledge for my better good.");
		e.other:Ding();
		e.other:SummonItem(15380);
		e.other:Faction(60,10,0); --faction with Crimson hands increased
		e.other:Faction(145,10,0); --faction with High Council of Erudin increased
		e.other:Faction(143,-30,0); --faction with Heretics decreased
		e.other:Faction(147,10,0); --faction with High Guards of Erudin increased
		e.other:AddEXP(1000);
		e.other:GiveCash(0,7,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

--END of FILE Zone:erudnint  ID:24072 -- Josper_Kenshed