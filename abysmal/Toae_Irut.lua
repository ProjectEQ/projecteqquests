function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hi. [No trouble] is dere? Toae here to stop trouble. Any trouble. If dere [big trouble], you let Toae know!");
	elseif e.message:findi("No trouble") then
		e.self:Say("Good! You make sure it stay dat way!");
	elseif e.message:findi("big trouble") then
		e.self:Emote("panics. 'You tell someone!");
		eq.signal(279188,1); -- Vucandra_Ouan
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end