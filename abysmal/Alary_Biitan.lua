function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Well hello there.  I don't suppose you know anything about fixing carts, do ya?  Grumby and his boys keep breakin' these and they're just about the only two carts we have. I ain't too keen on the [" .. eq.say_link("way") .. "] they've decided to move our supplies without the carts.");
	elseif e.message:findi("way") then
		e.self:Say("You must not have been here long' Alary smiles and shakes his head.  'If you wander down to the hold you'll certainly see what I mean.  Most of them in Grumby's crew don't have the strength to lift one of these big crates, so they mostly just sit there and act busy. Those that do have the strength... let's just say that it's a good thing we don't have any eggs left.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end