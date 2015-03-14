function event_spawn(e)
	eq.set_timer("depop",180000); --this triggered mob is only available for three minutes then depops
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I... am... the... Master... of... Elements.. Elements... Forgive... me. I am... unaccustomed.. to.. speaking.. this.. mortal... tongue. Might.. you... be... the... One?");
	elseif(e.message:findi("i am the one")) then
		e.self:Say("Trilith... Magi'kot.. knelt.. before.. the.. orb.. in.. his.. his.. last.. few.. moments... of.. mortal.. life. He... too... believed.. that.. he.. had.. the.. power.. and.. balance.. needed.. to.. grasp... control.. of.. the.. elements. He.. was.... flawed. Coming.. to... me... is.. a.. matter.. of.. no.. small.. import. Only.. only... one.. who.. is.. of.. balance.. and.. power... power.. may.. control.. the.. Orb.. of... Mastery. Give.... give.. me.. the.. Elements.. you.. have... gathered.. and.. I.. shall.. see.. if.. you.. are.. ready.. ready.. to control.. the... Elements.. of... life.. life.. life.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 28032, item2 = 28009, item3 = 28006, item4 = 28033})) then
		e.self:Say("You... are.. balanced... and.. powerful.. for.. a.. mortal... " .. e.other:GetName() .. " ..... " .. e.other:GetName() .. ". More.. so.. than.... Magi'kot. But.... you.. are.. not.. yet.. ready.. to.. transcend.. transcend... this.. mortal.. coil. Take.. take.. seize.. this.. Orb... for.. you.. are.. worthy.. of.. reward.. and.. with... the.. aid.. of... the... balance.. balance.. contained.. within.. the.. Orb.. you.. may.. yet.. reach.. the... ultimate... Mastery.");
		e.other:SummonItem(19436);
		eq.depop();
		eq.stop_timer("depop");
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
	eq.stop_timer("depop");
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
