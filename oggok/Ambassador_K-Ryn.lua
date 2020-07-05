-- items: 18842, 18843
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Get your wretched hide away from me! Who knows what vile stench you have been rolling around in?! Do not speak with me unless you have some glimmer of intelligence!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 18842})) then -- Sealed Letter (Letter To Krynn)
		e.self:Say("Another young warrior. I pray you shall not meet the fate of the last twelve. Here then. Take this report to Mistress Seloxia at once. And stay clear of the Froglok lair called Gukk.");
		e.other:AddEXP(250);--5% of level 2 experience, quest is for levels 2+
		e.other:SummonItem("18843"); -- Sealed Letter (Letter To Seloxia)
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
