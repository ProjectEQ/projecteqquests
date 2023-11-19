function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail.  Good to see you aboard.  I hope you find the ship comfortable and your [sleep] is undisturbed.");
	elseif e.message:findi("sleep") then
		e.self:Say("Ah, well, some folks here have had a hard time resting -- mostly those with some magical ability.  Some say their [nightmares] relate somehow to the buoys and their magic.  Some blame the Grozmok Stone.  I think that whatever evil we've come here to destroy is seeping into their dreams.  It's the one time that I'm glad I never had the capacity for magic.");
	elseif e.message:findi("nightmares") then
		e.self:Say("Please don't let my words disturb you.  Only a few have had bad dreams and I wouldn't want my words trouble you.  They are only dreams, and as long as yours remain untroubled, then we will both be happy.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end