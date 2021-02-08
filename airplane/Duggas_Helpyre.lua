-- items: 20953, 20786, 20787, 14560, 20790, 20967, 20791, 20792, 11689, 20960, 20788, 20789, 27713
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So, you dare be seen in my precense. Truly a brave fool you are. You come seeking fame and glory here do you? Well fool, perhaps you will get what you seek. Shall you take the test of the Heart, the Hands, or the Finger?");
	elseif(e.message:findi("heart")) then 	--necromancer test of heart
		e.self:Say("So the heart it be. Bring me, foolish one, an Imp Statuette, an Obsidian Amulet, and a Pulsating Ruby. Perhaps then, you shall find your reward.");
	elseif(e.message:findi("hands")) then 	--necromancer test of hands
		e.self:Say("The test of the Hands it shall be. Bring me a Gorgon's Head, some Aged Nectar, a Glowing Black Pearl, and an Efreeti's Great Staff. When you return, I shall reward you for your deeds, assuming you live through the experience. Hahaha!");
	elseif(e.message:findi("finger")) then 	--necromancer test of the finger
		e.self:Say("The finger. Needed for nearly every casting you shall ever hope to produce, it truly is the most powerful creation. Should you bring me a White Spiroc Feather, a Nebulous Ring, and the Ring of Veeshan, I shall reward you with power that you can just now begin to comprehend.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20953, item2 = 20786, item3 = 20787})) then 					--necromancer test of heart using imp statuette, obsidian amulet, pulsating ruby
		e.other:SummonItem(14560); --sphinx heart amulet
		e.other:AddEXP(100000);
		e.self:Say("Haha! So you lived! Take this and be gone!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20790, item2 = 20967, item3 = 20791, item4 = 20792})) then 	--necromancer test of hands using gorgon's head, aged nectar, glowing black pearl, efreeti's great staff
		e.other:SummonItem(11689); --gorgon head staff
		e.other:AddEXP(100000);
		e.self:Say("Haha! So you lived! Take this and be gone!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20960, item2 = 20788, item3 = 20789})) then 	--necromancer test of the finger using white spiroc feather, nebulous ruby, ring of veeshan
		e.other:SummonItem(27713); --band of wailing winds
		e.other:AddEXP(100000);
		e.self:Say("Haha! So you lived! Take this and be gone!");
		eq.depop();
	else
		e.self:Say("What? What are these for? Go Away!");
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
