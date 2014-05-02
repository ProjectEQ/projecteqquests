function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Hail there, " .. e.other:GetName() .. "! If you are not a [member of the White Rose], then it be best that you stay on the lower level. This here floor is for honest ...ermm respectable rogues only.");
	elseif(e.message:findi("member of the white rose")) then
		e.self:Say("I hope that you are indeed respectable and loyal to Halas and the Rogues of the White Rose. To do otherwise would bring the wrath of the Six Hammers down on you. But enough with talk! Our caravan to the frigid north leaves in less than two days. and we are short on mammoth calf hides. Return four of them and you will be given items that show your loyalty to our Clan.");
		eq.signal(29070,1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 5243, item2 = 5243, item3 = 5243, item4 = 5243})) then	-- Mammoth Calf Hide X 4
		e.self:Say("You returned? We believed the gnoll pups got you. The caravan has already left, and these do me little good now. But, as I said before, one must remain respectable. Here is what I promised.");
		e.other:SummonItem(eq.ChooseRandom(5238,5239,5242,5236,5233,5231,5240,5241,5234,5232,5235,5237));
		e.other:Faction(275,10,0); 																		-- 275 : Faction Rogue's of the White Rose
		e.other:AddEXP(2500);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
