--[[



Halloween event by ##Drogerin##


--]]

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail")) then
		e.self:Say("Oh dear, you startled me! Look at me just wandering afoot, a complete and utter mess, I just don't know what to do, will you [" .. eq.say_link("help") .. "] me");
	elseif (e.message:findi("help")) then
		e.self:Say("Oh my! I'm so grateful for your assistance, see I have some inside information that I believe might be interesting, would you like to [" .. eq.say_link("hear") .. "] it, or perhaps are you interested in [" .. eq.say_link("experience") .. "] instead?");
	elseif (e.message:findi("hear")) then
		e.self:Say("Theres a thief among our village in Rivervale! I've come to these lands to gain the aid of any willing adventurers big or small that would help me in the investigation to find out if my hunch is correct! If you would like more [" .. eq.say_link("information") .. "], just let me know and I'll give you the scoop.");
	elseif (e.message:findi("information")) then
		e.self:Say("We're scheduled to have the community Halloween festival in the middle of Rivervale like we do every year. We dance, we drink, we have a jolly good time!  I was placed in charge of the festival for gathering candy, drinks, and other assorted items by the city council. I gathered what candy and sweets I could from neighboring cities and brought them back.  Do you want to know what [" .. eq.say_link("happens next") .. "]");
	elseif (e.message:findi("happens next")) then
		e.self:Say("I was hoping you were still listening. The goods are gone! Someone took them! Oh no, whatever am I going to do, we can't have a festival if theres no candy, and sweets. I'm going to be the [" .. eq.say_link("laughing stock") .. "] of Rivervale");
	elseif (e.message:findi("laughing stock")) then
		e.self:Say("I think I have a hunch though of who took them. Someone has been traveling to Kithicor forest every night for the past fortnight. Something is going on and I intend to find out.  Will you [" .. eq.say_link("assist") .. "]  me, Oh pretty please!");
	elseif (e.message:findi("assist")) then
		e.self:Say("Oh thank you, thank you, thank you! I'll stay here and warn other adventurers like yourself so we can gather up a team! Take this letter explaining what we just talked about and hand it to the Innkeep Min just outside Rivervale in Kithicor. She's one of my dearest friends and I know she should have some information of when this thief comes and goes!");
		e.self:Say("Please return to me if you find anything!");
		e.self:Say("Oh, If you happen to lose the note just return to me I have a stack full!");
		e.other:SummonItem(21699); -- Item: Scribbled Parchment
		eq.set_global("Halloween2018","1",5,"h4");
	elseif (e.message:findi("willing") and qglobals["Halloween2018"] == "2") then
		e.self:Say("You've turned out to be more help than all of my city! Before we go back to kithicor, we're going to need some items. I'm going to need a flask of water, a stick of sugarcane, a sprig of spices, some steel wire, hemp twine, and a strands of golden thread for the trap");
		e.self:Say("Here, take this and combine it all in this bag and bring it back to me quickly! I'd imagine you can find all of these items around this area if you ask the merchants kindly enough");
		e.other:SummonItem(84016); -- Item: Collection Bag
	elseif (e.message:findi("experience")) then
		e.self:Say("Hello traveler! I need a certain idol that is deep in the ruins of Befallen, do you think you could search for one there and return it to me, I hear its very valuable. If you take the time to bring me one I will make it worth your while!");
		eq.set_global("Halloween2018EXP","1",5,"h4");
	end	
end

function event_timer(e)
	if (e.timer == "open_letter") then
		e.self:Say("Its as I feared. Someone has been stealing all of my goods, its about time we confront them. Are you [" .. eq.say_link("willing") .. "] to put up a fight if it comes to it?");
		eq.stop_timer("open_letter");
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	
	if(qglobals["Halloween2018"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 46200})) then -- Halloween 2018
		e.self:Say("Thank you " .. e.other:GetName() .. "! Lets see what the message says.");
		e.self:Emote("opens the letter and begins reading silently, her eyes widening the further down the note she goes.");
		eq.set_timer("open_letter",10000);
		eq.set_global("Halloween2018","2",5,"h3");
	elseif (item_lib.check_turn_in(e.trade, {item1 = 84017})) then
		e.self:Say("Wow, that was quick " .. e.other:GetName() .. "! Lets get a move on to Kithicor, Meet Innkeep Min back at her shop if you would, tell her 'you have returned' and she will assist you further on our plan of action");
		eq.set_global("Halloween2018","3",5,"h3");
	elseif (qglobals["Halloween2018EXP"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 19004})) then
		e.self:Say("Wow, I've never seen something so perfect before, here you go " .. e.other:GetName() .. ", you deserve this, thank you so much!");
		eq.set_global("Halloween2018EXP","2",5,"h4");
		local which=0;
		which = math.random(6);
		if  (which == 1) then
		e.other:SummonItem(41961); -- Item: Bottle of Adventure I
		elseif (which == 2) then
		e.other:SummonItem(41962); -- Item: Bottle of Adventure II
		elseif (which == 3) then
		e.other:SummonItem(43494); -- Item: Bottle of Adventure III
		e.self:Say("What luck!");
		elseif (which == 4) then
		e.other:SummonItem(48083); -- Item: Bottle of Shared Adventure I
		elseif (which == 5) then
		e.other:SummonItem(48084); -- Item: Bottle of Shared Adventure II
		elseif (which == 6) then
		e.other:SummonItem(48085); -- Item: Bottle of Shared Adventure III
		e.self:Say("WOW! Congratulations!");
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
