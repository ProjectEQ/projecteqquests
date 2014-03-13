-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("king akanon")) then
		e.self:Say("Brell strike you down for not knowing!!  Who could not have heard of the name of his royal highness King Horatio Ak'Anon. This great city is named after him. He rules from his throne room in Ak'Anon Palace which he constructed upon the underground lake.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
