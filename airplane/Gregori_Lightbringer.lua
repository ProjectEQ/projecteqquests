-- items: 20725, 20964, 20726, 20727, 11682, 20950, 20721, 20722, 27708, 20957, 20723, 20724, 11681
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("As I said before, the test of the heart is in three parts.  Compassion, Sacrifice and Love. Choose one and we will begin.");
	elseif(e.message:findi("compassion")) then 	--paladin test of compassion
		e.self:Say("Compassion is of great importance to us. Without it, we do not feel empathy, and cannot truly follow the path we claim to travel. Return to me an Efreeti zweihander, dulcet nectar, a golden hilt, and a large sky diamond. If you present these to me, I will award you Truvinan, the divine wind.");
	elseif(e.message:findi("sacrifice")) then 	--paladin test of sacrifice
		e.self:Say("You have sacrificed much to come so far Erudite. Sacrifice this one last time and the sword of ocean breeze shall be yours. Retrieve a griffon statuette, a spiroc peace totem, and a bixie sword blade.");
	elseif(e.message:findi("love")) then 		--paladin test of love
		e.self:Say("Love is what makes us close to the gods we follow. Without it, we could not truly worship them, and would be lost. Prove yourself to me and return with a dark spiroc feather, ethereal topaz, and a sphinx claw.  In return I will give you Zephyrwind.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20725, item2 = 20964, item3 = 20726, item4 = 20727})) then 		--paladin test of compassion using efreeti zweihander, dulcet nectar, golden hilt, large sky diamond
		e.other:SummonItem(11682); --Truvinan, the divine wind
		e.other:AddEXP(100000);
		e.self:Say("");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20950, item2 = 20721, item3 = 20722})) then 	--paladin test of sacrifice using griffon statuette, spiroc peace totem, bixie sword blade
		e.other:SummonItem(27708); --Aldryn, blade of the ocean
		e.other:AddEXP(100000);
		e.self:Say("");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20957, item2 = 20723, item3 = 20724})) then 	--paladin test of love using dark spiroc feather, ethereal topaz, sphinx claw
		e.other:SummonItem(11681); --Zephyrwind
		e.other:AddEXP(100000);
		e.self:Say("");
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
