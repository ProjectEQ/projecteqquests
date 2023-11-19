function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello, ".. e.other:GetName() .. ".  I hope this day has been kind to you.  The future is beyond our reach, but today is ours to enjoy.  A [friend] of mine taught me that.  It's helped to make me a much happier person, and it's given me the strength to come along on this journey.");
	elseif e.message:findi("friend") then
		e.self:Say("Oh, why Galadra said that.  She's really great about cheering me up.  I suspect without her presence on the Queen, many of us would have given up a while ago.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end