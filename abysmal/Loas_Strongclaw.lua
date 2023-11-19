function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Greetings.  May your teeth remain sharp and your food fresh.  Have you been to Taelosia?  I can't wait for my chance to set foot on the new continent, though for now I have guard duty and other tasks to attend to.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end