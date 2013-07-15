function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Please look around. We have many items exclusively for the members of the Temple of Life. We also have [scroll strongboxes]. If you are unsure of what an item is, feel free to ask me.");
	elseif(e.message:findi("scroll strongbox")) then
		e.self:Say("The scroll strongboxes are merely personal safes. Most of the members use them. I am afraid all are taken, but if you are here to remove a scroll, merely hand me your key and I shall get it for you. I handle all 20 numbered keys and [Whysia] handles all 30 and 40 numbered keys.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13306})) then
		e.self:Say("Oh, turning in your key, are you? Very well, defender of life. Here you are.");
		e.other:SummonItem(eq.ChooseRandom(15126,15126,15248));
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
