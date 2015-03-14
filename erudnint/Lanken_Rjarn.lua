function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 50, xloc + 50, yloc - 50, yloc + 50);
end

function event_enter(e)
	if(e.other:HasItem(18729)) then
		e.other:Message(15,"A commanding, yet kind looking Erudite turns towards you. 'Do not be startled. I am Lanken Rjarn, Guild Master for all aspiring Enchanters. Read the note in your inventory and hand it to me when you are ready to begin your training. I look forward to training you.'");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("looks up irritably. 'I do not have time to speak with thee. I have a problem on my hands. Feel free to speak with any of my trainers.'");
	elseif(e.message:findi("problem")) then
		e.self:Say("My problems are of no concern of yours. but if you must know it deals with Nolusia's brother. I can tell you no more. Leave me be.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18729})) then
		e.self:Say("Welcome to the Craft Keepers! You have much to learn. and I'm sure you are anxious to get started. Here's your training robe. Go see Nolusia. she'll give you your first lesson.");
		e.other:SummonItem(13549);
		e.other:Ding();
		e.other:Faction(56,100,0); -- Craftkeepers
		e.other:Faction(145,10,0); -- High Council of Erudin
		e.other:Faction(143,-15,0); -- Heretics
		e.other:Faction(147,15,0); -- High Guard of Erudin
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnint  ID:24032 -- Lanken_Rjarn