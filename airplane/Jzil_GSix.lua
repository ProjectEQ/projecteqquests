-- Necromancer Epic NPC -- Jzil_GSix

function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Ah, so you have come to be tested. Many fine things can be your reward. There are three tests which I can administer. Shall you take the test of flight, power, or mind?");
	elseif(e.message:findi("flight")) then 			--necromancer test of flight
		e.self:Say("So, you wish the test of flight? So be it. You must return to me a Verdant Tessera, an Ebon Shard, and a Griffons Beak to reap your rewards. May the darkness guide your steps.");
	elseif(e.message:findi("test of power")) then 	--necromancer test of power
		e.self:Say("The test of power it is. Prove yourself worthy of power and bring me a silver disc, spiroc feathers, and a black silk cape. Only then will you know true power.");
	elseif(e.message:findi("mind")) then 			--necromancer test of mind
		e.self:Say("So, the test of mind it shall be. You must return to me, from this place of air and mist a Rogous Globe, some Djinni Blood, and some Fine Cloth Raiments. Then, and only then, you shall have the reward that you deserve!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20932, item2 = 20780, item3 = 20781})) then 	--necromancer test of flight using verdant tessera, ebon shard, griffon's beak
		e.other:SummonItem(27712); --bloody griffon-hide wrist guard
		e.other:AddEXP(1000000);
		e.self:Say("Very good. Now take this and leave me.");
		eq.stop_timer("depop");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20938, item2 = 20782, item3 = 20783})) then --necromancer test of power using silver disc, spiroc feathers, black silk cape
		e.other:SummonItem(1278); --cloak of spiroc feathers
		e.other:AddEXP(1000000);
		e.self:Say("Very good. Now take this and leave me.");
		eq.stop_timer("depop");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20945, item2 = 20784, item3 = 20785})) then --necromancer test of mind using rogous globe, djinni blood, fine cloth raiment
		e.other:SummonItem(1279); --bloodsoaked raiment
		e.other:AddEXP(1000000);
		e.self:Say("Very good. Now take this and leave me.");
		eq.stop_timer("depop");
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
