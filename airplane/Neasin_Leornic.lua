-- items: 20930, 20741, 20742, 1272, 20937, 20743, 20744, 1271, 20944, 20745, 20746, 1273
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of concentration, focus, or meditation?");
	elseif(e.message:findi("concentration")) then 	--wizard test of concentration
		e.self:Say("Concentration it is. Proceed upward through the sky and return to me an Azure Tessera, an Augmentor’s Gem, and a Grey Damask Cloak. This will prove your ability to concentrate and I will reward you with an Augmentors Mask.");
	elseif(e.message:findi("focus")) then 			--wizard test of focus
		e.self:Say("Focus is a must. Travel among the residents of the sky and bring to me an Iron Disc, an Ethereal Opal, and a Woven Skull Cap. This will prove your ability to focus and I will reward you with Al`Kabors Cap.");
	elseif(e.message:findi("meditation")) then 		--wizard test of meditation
		e.self:Say("Meditation, the fix for all. Fly to those above and return to me a Hyaline Globe, a Sky Topaz, and a High Quality Raiment. If you are successful, I will reward you with the Raiment of Thunder.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20930, item2 = 20741, item3 = 20742})) then 	--wizard test of concentration using azure tessera, augmentor's gem, grey damask cloak
		e.other:SummonItem(1272); --augmentor's mask
		e.other:AddEXP(100000);
		e.self:Say("Ah good. Take this as your reward.");
		eq.depop();

	elseif(item_lib.check_turn_in(e.trade, {item1 = 20937, item2 = 20743, item3 = 20744})) then --wizard test of focus using iron disc, ethereal opal, woven skull cap
		e.other:SummonItem(1271); --Al`kabor's cap of binding
		e.other:AddEXP(100000);
		e.self:Say("Ah good. Take this as your reward.");
		eq.depop();

	elseif(item_lib.check_turn_in(e.trade, {item1 = 20944, item2 = 20745, item3 = 20746})) then --wizard test of meditation using hyaline globe, sky topaz, high quality raiment
		e.other:SummonItem(1273); --raiment of thunder
		e.other:AddEXP(100000);
		e.self:Say("Ah good. Take this as your reward.");
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
