function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day, traveler! You look as though you are in need of [superior armor]. We here at Firepride's specialized in armor.");
	elseif(e.message:findi("superior armor")) then
		e.self:Say("Our forge skills were acquired from the armor lords of Kaladim, as were our [drinking skills].");
	elseif(e.message:findi("drinking skill")) then
		e.self:Say("I learned the love of ale from the dwarves of Kaladim. Maybe someday I sall see you in the backroom at Fish's. If I do, don't forget to buy me an Ogre Swill.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end