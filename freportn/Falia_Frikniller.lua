function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Aye, hello there, friend! How are ye on this fine day? A beautiful day to be alive, I must say! Anyway, I just got into Freeport last month. Wow, is this city big! Way bigger than humble little Rivervale. That's where I'm from. I'm working on setting up my own little business here, Falia's Foot Combs and Footwear, it'll be called. But, I don't have anything to sell yet, so check back in a couple of weeks. Safe travels to ye, friend.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18925})) then
		e.self:Say("Heh, that good for nothing fool. I've been here for over a month already, and I haven't seen him yet. Bah, anyway, could you take this back to him for me? It was our grandfather's lucky necklace. He passed it down to our father, and now onto my brother. Knowing that little worm, Grenny, he'll probably trade it for a mug of ale. Oh well, thanks for delivering the letter, friend. Good day to you, and safe travels.");
		e.other:SummonItem(13159);
		e.other:Ding();
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
