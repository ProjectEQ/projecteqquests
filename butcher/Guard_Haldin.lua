-- items: 18905, 5037, 5029, 13313
function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18905})) then
		e.self:Say("The slaves...thank you! Here, this will help you slaughter those foul orcs!");
		e.other:AddEXP(30000);
		e.other:Ding();
		e.other:SummonItem(eq.ChooseRandom(5037,5029,13313)); -- Item(s): Bronze Two Handed Battle Axe (5037), Bronze Bastard Sword (5029), Dwarven Axe (13313)
	end

	item_lib.return_items(e.self, e.other, e.trade);
end

--by Angelox
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
