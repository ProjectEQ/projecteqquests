function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s!  Welcome to Fish's Ale. I am Fish Ranamer, owner of the joint.  Come in and have some brew but don't be startin' no trouble or Bruno will bust you open!",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
