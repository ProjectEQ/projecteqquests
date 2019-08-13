--Drogerin

--General Vendor

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to my store, " .. e.other:GetName() .. ".  Please browse the wares I have for sale, and let me know if there's anything that you need.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
