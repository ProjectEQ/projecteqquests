-- Converted to .lua by Speedz
-- items: 20694, 20697

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("gives you a crooked smile. 'Hello there, " .. e.other:GetName() .. ". I'm doin some important 'meditations' to my god here. Maybe you can go somewhere else?'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20694})) then
		e.self:Emote("looks up at you with a twisted gleam in his eyes. 'Something for me then, eh?' As he looks closer his skin begins to peel and stretch, a bright hot light emanating from his hands gripped around the unicorn horn. 'NOOOO!' The pure cleansing light burns away the gnome without a trace of his existence except for a tiny ball of light which you pick up.");
		e.other:SummonItem(20697); -- Item: Cleansed Spirit of Faydwer
		e.other:Ding();
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
