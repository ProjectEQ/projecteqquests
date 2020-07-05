-- items: 28054, 17175, 28059
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("stares at you with unblinking eyes. A wide grin crosses Zordak's face and flames flicker in the depths of his eyes, 'Welcome to the new fortress of the Plasmatic Priesthood! It's a shame about Lord Nagafen's untimely death, really it is! Such a powerful and noble creature should not perish at the hands of mortals.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 28054})) then -- Shimmering Pearl
		e.self:Emote("is engulfed by a shimmering blue light! An inhuman expression of rage crosses his face and flames leap in his eyes as he begins to vanish in the shimmering light! 'The Triumvirate may have succeeded in sending me back to my cursed homeland for the time being! I swear to you I shall return from Skyfire and destroy all of the Triumvirate Missionaries in flames!'");
		e.other:SummonItem(17175); -- Zordak's Box of Bindings
		e.other:SummonItem(28059); -- Swirling Pearl
		e.other:Ding();
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- End of File, Zone:soldungb  NPC:32038 -- Zordak_Ragefire