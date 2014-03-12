function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("The tests of old are difficult and dangerous, but the rewards for perseverance are great. I hold rewards for three tests. The test of the Wolf, test of the Bear and the test of the Tree.");
	elseif(e.message:findi("test of the wolf")) then --druid test of the wolf
		e.self:Say("So you wish the test of The Wolf do you? Go forth unto the islands and find an Azure Tessera, Black Face Paint and finally a Worn Leather Mask. Bring them back to me, but not until you have all three and you shall be rewarded.");
	elseif(e.message:findi("test of the bear")) then --druid test of the bear
		e.self:Say("Ah, the test of The Bear It Is. Find In this plane a Copper Disc, a Sky Emerald and a Mantle of Woven Grass. Bring all three at one time to me for your reward.");
	elseif(e.message:findi("test of the tree")) then --druid test of the tree
		e.self:Say("The test of The Tree Is said to be a test of Nature and only those stout of limb and bark will succeed. Bring to me a Diaphanous Globe, some Hardened Clay and a Spiroc Battle Staff. Hand them all to me at once and the Reward will be yours.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20930, item2 = 20728, item3 = 20729})) then 	--druid test of the wolf using azure tessera, black face paint, worn leather mask
		e.other:SummonItem(2706);  	--drake-hide mask
		e.other:AddEXP(100000);
		e.self:Say("Good work.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20936, item2 = 20731, item3 = 20730})) then --druid test of the bear using copper disc, mantle of woven grass, nature walker's sky emerald
		e.other:SummonItem(2705); 	--nature walker's mantle
		e.other:AddEXP(100000);
		e.self:Say("Good work.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20943, item2 = 20732, item3 = 20733})) then --druid test of the tree using diaphanous globe, hardened clay, spiroc battle staff
		e.other:SummonItem(6411); 	--shillelagh
		e.other:AddEXP(100000);
		e.self:Say("Good work.");
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.stop_timer("depop");
	eq.depop();
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
