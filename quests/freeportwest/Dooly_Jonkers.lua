function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s! Welcome to the Academy of Arcane Science. Nowhere on Norrath can you find a greater learning center.",e.other:GetName()));
	elseif(e.message:findi("retlon brenclog")) then
		e.self:Say("I'm very sorry to report that Retlon was kidnapped by some vile orcs from Crushbone. And I haven't seen him since.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Dooly_Jonkers