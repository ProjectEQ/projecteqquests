function event_say(e)
    e.self:Say("Hello, friend.  I am having second thoughts on being here.  Don't get me wrong, the Wayfarers Brotherhood has been very good to me, but I have been having bad nightmares ever since we arrived.");
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end