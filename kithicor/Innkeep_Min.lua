function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if (e.message:findi("I have returned") and qglobals["Halloween2018"] == "5") then
		e.other:Say("Oh it appears you were able to talk to Crysta, yes she got with me earlier this evening and we made the trap together. She was suppose to be here, but it seems she went to the Misty Thicket instead. You should seek her out there, I think she has a plan.");
		eq.set_global("Halloween2018","6",5,"h3");
	elseif (e.message:findi("accept") and qglobals["Halloween2018"] == "1") then
		e.self:Say("Here you go, bring these back to Crysta. She will be most pleased with my information, and don't try to put your nose in there you'll never understand those notes!");
		e.other:SummonItem(46200);
		eq.set_global("Halloween2018","2",5,"h3");
	elseif(e.message:findi("hail")) then
			e.self:Say("Greetings. " .. e.other:GetName() .. "!  Sure is strange seeing so many visitors lately out here in Kithicor. Good for business I guess!"); -- Halloween 2018
	end
end

function event_timer(e)
	if (e.timer == "Item") then
		e.self:Say("Ahh here we are, I knew they were somewhere, Tell me when you're ready to [" .. eq.say_link("accept") .. "] them");
		eq.stop_timer("Item");
	end
end

	

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 21699}) and qglobals["Halloween2018"] == "1") then -- Halloween 2018
		e.self:Say("Oh my, Crysta sure is serious about this if she's sending random adventurers out here. Let me look through my notes, can you hold on a second?");
		eq.set_timer("Item",7000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
