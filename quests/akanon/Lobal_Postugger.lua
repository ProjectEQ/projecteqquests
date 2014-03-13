-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. I am the guild master.");
	elseif(e.message:findi("dark assassin")) then
		e.self:Say("You have heard of him? I had a nice conversation with him. Sharing some secrets of gnomish spirits if yah know what i mean! In return he gave me a sketch that looks quite interesting. Of course I am stuck in this place waiting youngsters to teach when I would rather be out with you making poisons. Perhaps you are willing to make a trade with me for the sketch?");
	elseif(e.message:findi("trade")) then
		e.self:Say("Fantastic! If you combine Rage of Incapacitation, Wasted Flesh and Dreams of Drusella within a coffin bottle you can make me a nice bundle of poisons to play with. Then I will have no need for the sketch.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 9470})) then	-- Bundle of Poisons
		e.self:Emote("laughs. 'Here, take this then!'"); 		-- text made up
		e.other:SummonItem(24096); 								-- Dip Resist Sketch
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
