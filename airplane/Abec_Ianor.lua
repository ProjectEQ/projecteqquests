-- items: 20951, 20747, 20748, 11686, 20958, 20749, 20750, 14556, 20753, 20965, 20751, 20752, 11685
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of conception, visualization, or preparation?");
	elseif(e.message:findi("conception")) then		--wizard test of conception
		e.self:Say("Conception is vital. Travel beyond and bring forth an Efreeti Statuette, a Mithril Air Ring, and a Box of Winds. From these I will produce a ring that will protect you where ever you go.");
	elseif(e.message:findi("visualization")) then	--wizard test of visualization
		e.self:Say("Visualize and succeed. Proceed upward and bring to me a White-Tipped Spiroc Feather, a Pulsating Sapphire, and an Amethyst Amulet. With these items, I will be able to produce an amulet that will aid in your travels to our home.");
	elseif(e.message:findi("preparation")) then		--wizard test of preparation
		e.self:Say("Always be prepared. Adventure and return an Efreeti War Staff, some Lush Nectar, a Copper Air Band, and a large Sky Sapphire and you shall be rewarded with the Staff of Storms.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20951, item2 = 20747, item3 = 20748})) then						--wizard test of conception using efreeti statuette, mithril air ring, box of winds
		e.other:SummonItem(11686); --solidate mithril ring
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Take this.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20958, item2 = 20749, item3 = 20750})) then					--wizard test of visualization using white-tipped spiroc feather, pulsating sapphire, amethyst amulet
		e.other:SummonItem(14556); --amulet of planar transference
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Take this.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20753, item2 = 20965, item3 = 20751, item4 = 20752})) then	--wizard test of preparation using efreeti war staff, lush nectar, copper air band, large sky sapphire (eye of the storm, 0.1 wt)
		e.other:SummonItem(11685); --nargon's staff
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Take this.");
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
