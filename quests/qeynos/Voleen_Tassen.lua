function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Oh, it's so nice to see you again %s. Why don't you have a look around and buy something nice for yourself today?",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib =require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
