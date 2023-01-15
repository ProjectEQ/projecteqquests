-- items: 20774, 20952, 20802, 14559, 20959, 20775, 20776, 14558, 20777, 20779, 20778, 20966, 27711
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! I have three tests from which you can choose from. They are Disillusion, Memorization, and Incapacitation.");
	elseif(e.message:findi("disillusion")) then  	--enchanter test of disillusion
		e.self:Say("Disillusion it is. Proceed upward through the sky and return to me a Harpy Statuette, a Nebulous Sapphire, and an Adamintium Earring. This will prove your abilities to me and I will reward you with an Earring of Displacement.");
	elseif(e.message:findi("memorization")) then 	--enchanter test of memorization
		e.self:Say("Memorization it is. Proceed upward through the sky and return to me a Carmine Spiroc Feather, a Ganoric Poison, and a Glowing Necklace. This will prove your abilities to me and I will reward you with a Necklace of Whispering Winds.");
	elseif(e.message:findi("incapacitation")) then 	--enchanter test of incapacitation
		e.self:Say("Incapacitation it is. Proceed upward through the sky and return to me an Efreeti Wind Staff, some Sweet Nectar, a Black Sky Diamond, and a Large Sky Sapphire. This will prove your abilities to me and I will reward you with the Staff of Warding Winds.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20774, item2 = 20952, item3 = 20802})) then 					--enchanter test of disillusion using adamantium earring, harpy statuette, nebulous sapphire
		e.other:SummonItem(14559);  --earring of displacement
		e.other:AddEXP(100000);
		e.self:Say("Good. Take this as your reward.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20959, item2 = 20775, item3 = 20776})) then 				--enchanter test of memorization using carmine spiroc feather, ganoric poison, glowing necklace
		e.other:SummonItem(14558);  --necklace of whispering winds
		e.other:AddEXP(100000);
		e.self:Say("Good. Take this as your reward.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20777, item2 = 20779, item3 = 20778, item4 = 20966})) then 	--enchanter test of incapacitation using black sky diamond, efreeti wind staff, large sky sapphire, sweet nectar
		e.other:SummonItem(27711); 	--rod of protecting winds
		e.other:AddEXP(100000);
		e.self:Say("Good. Take this as your reward.");
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
