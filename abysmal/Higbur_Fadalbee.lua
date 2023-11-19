function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("What a view!  I'm sure to be the first to see a [sea monster] from here!");
	elseif e.message:findi("sea monster") then
		e.self:Say("They asked for volunteers to watch out for monsters, so I raised my hand.  I think I even jumped up and down a bit.  Who wouldn't!  Sure, I've seen monsters.  I'm one with the wall, and all that, but Rivervale has no ocean.  I've seen a few sea creatures, sure, but a shark isn't a sea monster.  I can't wait to see one!  Sure, they'll kill it and that's sad, but at least I'll see one.  I can't wait!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end