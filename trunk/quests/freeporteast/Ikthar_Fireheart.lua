function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You look like the type who needs a suit of sturdy plate mail! I've got plenty of steel plate in stock but if you're looking for field plate we've been out of the [necessary ores] for quite some time.");
	elseif(e.message:findi("necessary ore")) then
		e.self:Say("Field plate is stronger than steel or fine steel plate and offers more protection to certain areas of the body. Unfortunately. it can only be crafted with high quality ores from those goblin infested mines. If you are planning on getting some ore I can instruct you in the [techniques of crafting field plate].");
	elseif(e.message:findi("techniques of crafting field plate")) then
		e.self:Say("Field plate may only be crafted in the special Freeport forge located in West Freeport. All pieces will require the appropriate plate mold. sea temper. a smithy hammer. leather backing. and chain jointing. Different amounts of ore will be needed for the various pieces of armor and the ore must be worked into [folded sheets].");
	elseif(e.message:findi("folded sheet")) then
		e.self:Say("Folded sheets of high quality ore can be crafted only in the special Freeport forge or Qeynos Royal Forge in the same fashion that regular folded sheets are fashioned in a standard forge. Field plate visors. collars. and bracers require only one folded sheet of high quality ore. Helms. pauldrons. girdles. vambraces. gauntlets. and boots require two folded sheets of high quality ore. Breastplates. greaves. and cloaks require three folded sheets of high quality ore.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end