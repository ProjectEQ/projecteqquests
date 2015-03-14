function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail! So you think you are a mighty Knight of Shadows? We must test these skills. Are you ready to begin the test?  Or do you think you have already proof of your deeds?");
	elseif(e.message:findi("ready")) then
		e.self:Say("Great, let us waste no more time! I offer to you three challenges: Bash, smash, or slash. What do you wish to be tested in?");
	elseif(e.message:findi("bash")) then	--shadowknight test of bash
		e.self:Say("Gragrot like bashin. Gragrot say you like bashin too! Give Gragrot an Ebon Tessera, a Sphinx Eye Opal, and a Finely Crafted Amulet. Gragrot then give you Sphinx Eye Amulet.");
	elseif(e.message:findi("smash")) then 	--shadowknight test of smash
		e.self:Say("Gragrot wants you smashin. Smash, smash, and return a Copper Disk, a Small Sapphire, and a Silvery Ring. Then Gragrot give you Djinni's Finger Ring.");
	elseif(e.message:findi("slash")) then 	--shadowknight test of slash
		e.self:Say("Gragrot see you is powerful, but Gragrot wonders if you is good at Slashin. Gragrot says return with a Diaphanous Globe, a piece of dried leather, and a Finely Woven Cloth Belt. Gragrot then give you pegasus hide belt.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20929, item2 = 20997, item3 = 20998})) then 	--shadowknight test of bash using ebon tessera, sphinx eye opal, finely crafted amulet
		e.other:SummonItem(14554); --sphinx eye amulet
		e.other:AddEXP(100000);
		e.self:Say("You is powerful! Take this!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20936, item2 = 20999, item3 = 20700})) then --shadowknight test of smash using copper disc, small sapphire, silvery ring
		e.other:SummonItem(14553); --Djinni finger ring
		e.other:AddEXP(100000);
		e.self:Say("You is powerful! Take this!");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20943, item2 = 20701, item3 = 20702})) then --shadowknight test of slash using diaphanous globe, dried leather, finely woven cloth belt
		e.other:SummonItem(2704); --pegasus-hide belt
		e.other:AddEXP(100000);
		e.self:Say("You is powerful! Take this!");
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
