--#############
--#Quest Name:Honey Jum
--#Author:Shaznito
--#Revised and converted to Lua: robregen
--#NPCs Involved:Lil Honeybugger, Kizzie_Mintopp 
--#Items Involved:3 Honeycombs, 30 gold
--#################

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Enough talk there. chatterbox.  You buy lots of herbs.  I gotta make a living. not more friends.");
	elseif(e.message:findi("temple of life")) then
		e.self:Say("Oh, yes.. They always come for Kizzie's [" .. eq.say_link("honey jum",false,"honey jum") .. "]. They should have sent you next week. There is a [" .. eq.say_link("problem",false,"problem") .. "].");
	elseif(e.message:findi("problem")) then
		e.self:Say("You see.. Joogl Honeybugger is hurt. He usually collects the [" .. eq.say_link("Honeycombs",false,"Honeycombs") .. "]. Only he knows where to get them. I need the Honeycombs to make the Honey Jum. Go and speak with Joogl. He is at his burrow outside of Rivervale. He says he cannot work. Tell him you need the Honeycombs.");
	elseif(e.message:findi("honeycombs")) then
		e.self:Say("If Kizzie knew that, then she would not hire Joogl Honeybugger!  Go talk to him in the Misty Thicket.");
	elseif(e.message:findi("make honey jum")) then
		e.self:Say("No, no, no!!  You will not get honey jum until you give Kizzie three honeycombs and thirty gold coins.  Honey jum is valuable.  Kizzie raised the fee!!  That is how it works.");
	elseif(e.message:findi("honey jum")) then
		e.self:Say("It's a secret!!  I get the honeycombs and combine them with the secret sauce and..presto.. honey jum!!  It is used by only the wisest as a component.  And you can only get it from Kizzie.  It is also good on batwing crunchies.  If you like.. Kizzie can [" .. eq.say_link("make honey jum",false,"make honey jum") .. "] for you?");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13953,item2 = 13953,item3 = 13953,gold = 30})) then
		e.self:Say("You are one lucky bixie buster. I just made a batch of honey jum. Here. No waiting for you.  One jar for your good work. Bye, now!");
		e.other:SummonItem(13952);
		e.other:Ding();
		e.other:Faction(218,5,0);
		e.other:Faction(77,5,0);
		e.other:Faction(133,5,0);
		e.other:Faction(208,5,0);
		e.other:Faction(48,-5,0);
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:rivervale  ID:19070 -- Kizzie_Mintopp