-- items: 36211
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 36211})) then	-- Perfect Cherry Blossom
		e.self:Say("'Ah!  The perfect blossom... I can hardly believe my eyes!  For years have I searched in vain for those perfect petals only to find out that gardener was keeping it from me all this time.  I humbly thank you for your offer, kind adventurers and perhaps I can return the favor for I know who it is you seek.  With this in hand I can summon the hidden one for you.  Now go and greet him before he hides again!'");
		eq.unique_spawn(338406, 0, 0, 992, 410, 13, 442); -- NPC: Wong_Li
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
