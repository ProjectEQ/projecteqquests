-- items: 13293
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail, citizen! I am afraid you are not allowed in this building. You will have to leave. Good day to you.");
	elseif(e.message:findi("donate")) then
		e.self:Say("Why, of course! I would love to contibute to your esteemed organiztion. I would just hate to see the Knights of Thunder crumble. What would ever happen to Qeynos if their noble order were gone?! Perish the thought!");
		e.other:SummonItem(13293); -- Item: Donation
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
