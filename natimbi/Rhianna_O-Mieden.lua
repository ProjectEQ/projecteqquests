
function event_say(e)
  if(e.message:findi("hail")) then
		e.self:Say("Ahoy there friend. As always you are welcome to seek shelter here amongst us. Please take care, however. As you can see we have not much space that is safe from the eyes of these strange invaders. Watch your step!");
  end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
