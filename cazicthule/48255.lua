-- items: 8723, 8730, 8728, 8727, 8726, 8729
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 8723})) then
		e.other:SummonItem(eq.ChooseRandom(8730,8728,8727,8726,8729)); -- Item(s): Cogboggle's Clockwork Contraption (8730), Iron Cog Earring (8728), Rough Steel Cog Earring (8727), Tiny Gear Shaped Earring (8726), Shiny Cog Earring (8729)
		e.self:Emote("begins to cast a spell. Gimlik says, 'Well, you've got a good eye on you for being so daft. Thank you for returning my quill. Take care!' Gimlik gates.");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_spawn(e)
	eq.set_timer("depop", 600 * 1000);
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();	
end
