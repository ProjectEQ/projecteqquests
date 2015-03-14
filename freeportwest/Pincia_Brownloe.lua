function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Brownloe Bakery. Please try our muffins. One taste and you will yearn for no other. Nothing compares to a Brownloe Muffin!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("You are in luck! I have a fresh batch that just came out of the oven!");
		eq.signal(383082, 1, 10000);
	elseif(e.signal == 2) then
		e.self:Say("Farewell, then. I will make sure to have them ready for you tomorrow!");
		eq.signal(383082, 2, 10000);
	end
end

-- END of FILE Zone:freportw -- Pincia_Brownloe