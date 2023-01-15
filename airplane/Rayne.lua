-- items: 20963, 20994, 20995, 20996, 11677, 20949, 20990, 20991, 2701, 20935, 20987, 20986, 2702
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of Deception, Stealth, or Cunning?");
	elseif(e.message:findi("deception")) then 	--rogue test of deception
		e.self:Say("Deception it is. Proceed upward through the sky and return to me the honeyed nectar, a bixie stinger, a lightning rod, and a bloodsky sapphire for the test of deception and earn Ebonsting, caller of lightning.");
	elseif(e.message:findi("stealth")) then 	--rogue test of stealth
		e.self:Say("Stealth is a must. Travel among the residents of the sky and bring to me a Pegasus Statuette, a Prismatic Sphere, and a Fine Wool Cloak. In return, The Scintillating Bracer of Protection shall be yours.");
	elseif(e.message:findi("cunning")) then 	--rogue test of cunning
		e.self:Say("Cunning, the true source of all rogue power. Plan and succeed above us and return to me a bronze disc, a jester's mask, and some red face paint to compelte the test of cunning. The transparent mask shall be yours if you do so.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20963, item2 = 20994, item3 = 20995, item4 = 20996})) then  	--rogue test of deception using honeyed nectar, bixie stinger, lightning rod, bloodsky sapphire
		e.other:SummonItem(11677); 	--ebonsting
		e.other:AddEXP(100000);
		e.self:Say("Very good. Here's your reward.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20949, item2 = 20990, item3 = 20991})) then 	--rogue test of stealth using pegasus statuette, prismatic sphere, fine wool cloak
		e.other:SummonItem(2701); 	--scintillating bracer of protection
		e.other:AddEXP(100000);
		e.self:Say("Very good. Here's your reward.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20935, item2 = 20987, item3 = 20986})) then 	--rogue test of cunning using bronze disc, jester's mask, red face paint
		e.other:SummonItem(2702); 	--transparent mask
		e.other:AddEXP(100000);
		e.self:Say("Very good. Here's your reward.");
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
