
function event_say(e)
  if(e.message:findi("hail")) then
		e.self:Say("Welcome to the island. If you want to try your hand at fishing I have everything you need.");
  end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
