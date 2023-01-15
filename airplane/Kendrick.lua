-- items: 20928, 20984, 20985, 14552, 20989, 20942, 20988, 2703, 20956, 20992, 20993, 11676
function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Great, let us waste no more time! Do you wish to begin your test of Thievery, Silence, or Trickery?");
	elseif(e.message:findi("thievery")) then 	--rogue test of thievery
		e.self:Say("Thievery is absolute. Travel beyond and bring forth an Ivory Tessera, a gem of invigoration, and an inlaid choker to complete the test of thievery and earn the wispy choker of vigor!");
	elseif(e.message:findi("silence")) then 	--rogue test of silence
		e.self:Say("Silence makes us deadly. Proceed upward and bring to me a spiroc sky totem, a pearlescent globe, and a black griffon feather. Griffon Wing Spauldors shall be yours if you complete this.");
	elseif(e.message:findi("trickery")) then 	--rogue test of trickery
		e.self:Say("Trickery, ahh how Fizzlethorpe blesses us! Adventure and return a mottled spiroc feather, a cracked leather belt, and a sphinxian circlet to complete the test of trickery and earn Renards Belt of Quickness.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20928, item2 = 20984, item3 = 20985})) then 	--rogue test of thievery using ivory tessera, gem of invigoration, inlaid choker
		e.other:SummonItem(14552); 	--wispy choker of vigor
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Fizzlethorpe blesses you with this gift.");
		eq.depop();

	elseif(item_lib.check_turn_in(e.trade, {item1 = 20989, item2 = 20942, item3 = 20988})) then --rogue test of silence using spiroc sky totem, pearlescent globe, black griffon feather
		e.other:SummonItem(2703); 	--griffon wing spauldors
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Fizzlethorpe blesses you with this gift.");
		eq.depop();

	elseif(item_lib.check_turn_in(e.trade, {item1 = 20956, item2 = 20992, item3 = 20993})) then --rogue test of trickery using mottled spiroc feather, cracked leather belt, sphinxian circlet
		e.other:SummonItem(11676); 	--renard's belt of quickness
		e.other:AddEXP(100000);
		e.self:Say("Excellent! Fizzlethorpe blesses you with this gift.");
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
