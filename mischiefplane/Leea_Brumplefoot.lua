-- items: 9822
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if ((qglobals["Fatestealer_shak"] ~= nil and qglobals["Fatestealer_shak"] == "1") or e.other:HasItem(52355) or e.other:HasItem(52356)) and e.message:findi("blue orb") then
		e.other:SummonItem(9822); -- Item: Shard of Blue Metal
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
