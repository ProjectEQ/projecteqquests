function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I have three tests from which you can choose from. They are Illusion, Metamorphism, and Deception.");
	elseif(e.message:findi("illusion")) then --enchanter test of illusion
		e.self:Say("Illusion it is. Proceed upward through the sky and return to me a Crimson Tessera, a Darkstone Emerald, and a Finely Woven Gold Cord. This will prove your abilities to me and I will reward you with a Cord of Sphinx Hair.");
	elseif(e.message:findi("metamorphism")) then --enchanter test of metamorphism
		e.self:Say("Metamorphism it is. Proceed upward through the sky and return to me a Silver Disk, a Bluish Stone, and a Light Cloth Mantle. This will prove your abilities to me and I will reward you with the Wind Walker's Mantle.");
	elseif(e.message:findi("deception")) then --enchanter test of deception
		e.self:Say("Deception it is. Proceed upward through the sky and return to me a Rugous Globe, a Sky Pearl, and a Silken Mask. This will prove your abilities to me and I will reward you with an Ivory Mask.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20931, item2 = 20767, item3 = 20768})) then 	--enchanter test of illusion using crimson tessera, darkstone emerald, finely woven cloth cord
		e.other:SummonItem(1277); --sphinx hair cord
		e.other:AddEXP(100000);
		e.self:Say("Excellent work!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20769, item2 = 20770, item3 = 20938})) then --enchanter test of metamorphism using bluish stone, light cloth mantle, silver disc
		e.other:SummonItem(1276);  --wind walker's mantle
		e.other:AddEXP(100000);
		e.self:Say("Excellent work!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20945, item2 = 20772, item3 = 20771})) then --enchanter test of deception using rugous globe, silken mask, sky pearl
		e.other:SummonItem(1275);  --ivory mask
		e.other:AddEXP(100000);
		e.self:Say("Excellent work!");
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
