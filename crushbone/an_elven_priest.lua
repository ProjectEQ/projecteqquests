function event_say(e)
	if(e.message:findi("king is dead")) then
		e.self:Say("Dead you say? My goodness! Did you manage to slay the warlord too? If you provide me with proof of his death, I can enchant the mace the dwarf gave you as payment. But, I will require the proof first!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 2301})) then
		e.self:Say("Erollisi be praised! You slew the orc lord! Well, here is a token of my appreciation! Should you wish to have that mace enchanted, just hand me the mace and my token and I shall uphold my end of the bargain!");
		e.other:SummonItem(1900);
		e.other:Ding();
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 6315,item2 = 1900})) then
		e.self:Say("As promised, here is your mace. Let it not fall into dark hands as its power is hidden until combat when it will reveal its true nature. Fare thee well!");
		e.other:SummonItem(6305);
		e.other:Ding();
		e.other:AddEXP(10000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF an elven priest