-- items: 69970, 69967
function event_say(e)
	if(e.message:findi("nice hat")) then
		e.self:Say(string.format("Thank you, It is worn with pride and is the symbol of the Rivervale Militia"));
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 69970})) then
		e.self:Say("The note looks in order. Here you go " .. e.other:GetName() .. ". I would be careful holding that out in sight around here though. You need to watch your back around the fool's gold.");
		e.other:SummonItem(69967);	--vale prayer bead
	end
	item_lib.return_items(e.self, e.other, e.trade)
end