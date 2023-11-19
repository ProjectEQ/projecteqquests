function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Welcome!'  Taligda's voice booms at you from the depths of his chest.  'I hope you are well and may your fur remain supple.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end