# Wolf Meat for Wista
-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hi, do ya likes eatin', or puhaps Hukulk sent ya? I makes many gud eats. Doh, sum I can'ts make cause sum tings I ain't gots. I cud makes some berry tastie stuff wid only [" .. eq.say_link("sum wolf meat",false,"sum wolf meat") .. "].");
	elseif (e.message:findi("sum wolf meat")) then
		e.self:Say("Gets me two wolf meats sos I cans makes me foods. I gib ya sumting.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13403,item2 = 13403})) then -- Wolf Meat for Wista
		e.self:Say("Deez berry gud. Makes berry good suff. Me berry happy. Yous gets more bring dem ta mees. Yous takes dis and tanks fer da meats.");
		e.other:Ding();
		e.other:SummonItem(17004);
		e.other:Faction(131,10,0);  -- +Grobb Merchants
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
