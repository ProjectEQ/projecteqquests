function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("What is it that you want?  I generally don't speak to your type.  Unless you've seen something that might endanger this ship, you risk your own skin by [bothering] me while I'm busy.");
    elseif e.message:findi("bothering") then
        e.self:Say("Pfft.  Move along.  Go to the bar or lay about someplace.  Just get out of our way.  Shouldn't you be out on Taelosia defeating the enemy or something?");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end