function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("You need sumtin, [" .. eq.say_link("cutie") .. "]?");
	elseif e.message:findi("cutie") then
		e.self:Emote("blushes.");
		eq.signal(279079,1, 500); -- Kaleng
		eq.signal(279092,1, 600); -- Esunta
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end