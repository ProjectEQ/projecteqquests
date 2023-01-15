-- items: 69969
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 69969})) then
		e.self:Say("Thank you " .. e.other:GetName() .. " you are very compassionate. My brother must have sent you! Return to him, and he shall reward you. Goodbye, fair knight.");
		eq.set_global("paladin_epic_hollowc", "2", 5, "F");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end