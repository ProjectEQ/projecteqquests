--#############
--#Quest Name: Research Aid
--#Author: Blaz
--#Converted to Lua: robregen
--#NPCs Involved: 1
--#Items Involved: 3
--#################
-- items: 10300, 18175, 18176, 10400, 17504

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am Mrysila. custodian of the [Concordance of Research].");
	elseif(e.message:findi("concordance of research")) then
		e.self:Say("The 'Concordance of Research' is an aid to those who follow the path of academia. It, and its sister books, 'Runes and Research,' volumes I and II, help those who are [interested] in researching spells.");
	elseif(e.message:findi("interested")) then
		e.self:Say("I have several copies of each book. If you want a copy of 'Runes and Research', volume I or II, bring me a lightstone and I will give you whichever book I have more of at the moment. Bring me a greater lightstone, and I will give you a copy of the 'Concordance of Research.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10300})) then -- Lightstone turn in, reward is either Runes and Research Volume I or II
		e.self:Say("A lightstone? Thank you very much. Here is a copy of 'Runes and Research'.");
		e.other:SummonItem(eq.ChooseRandom(18175,18176)); -- Item(s): Runes and Research Volume I (18175), Runes and Research Volume II (18176)
		e.other:Ding();
		e.other:AddEXP(14500);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10400})) then -- Greater lightstone turn in, reward is Concordance of Research
		e.self:Say("A greater lightstone? Thank you very much. Here is a 'Concordance of Research' for you.");
		e.other:SummonItem(17504); -- Item: Concordance of Research
		e.other:Ding();
		e.other:AddEXP(16000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:northkarana  ID:13067 -- Mrysila