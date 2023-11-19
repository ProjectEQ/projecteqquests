function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("What do you want? I am leaving and going home as soon as I can. I never want to see this new land again. I should have never thought I could be an adventurer.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end