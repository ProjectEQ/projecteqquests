function event_spawn(e)
	eq.set_timer("depop",300000);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings " .. e.other:GetName() .. ". I can only assume my reasons for being summoned is that you wish to take the tests. Would you like to be tested in the body, in defense, or in the element of earth?");
	end
	if(e.message:findi("body")) then 				--ranger test of body
		e.self:Say("Very well. You must scour this plane and bring back to me these components: an auburn tessera, a ysgaril root, and a griffon talon. Make haste, and good luck.");
	end
	if(e.message:findi("defense")) then 			--ranger test of defense
		e.self:Say("Defense it is. You must prove yourself worthy enough for the Spiroc spirits to guard you. Bring back to me a mithril disc, a harpy tongue, and a fine velvet cloak. Good luck to you " .. e.other:GetName() .. ".");
	end
	if(e.message:findi("element of earth")) then 	--ranger test of the element of earth
		e.self:Say("Elemental earth you say? When honed, the elements can be among our best allies. Retrieve a gridelin globe, a dragon hide mantle, and a spiroc earth totem. Only with these items can you master the element of earth.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 20934, item2 = 20850, item3 = 20849})) then 	--ranger test of body using auburn tessera, griffon talon, ysgaril root
		e.other:SummonItem(2715); 	--griffon talon
		e.other:AddEXP(100000);
		e.self:Say("Good work, ranger.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20853, item2 = 20852, item3 = 20851})) then --ranger test of defense using fine velvet cloak, harpy tongue, mithril disc
		e.other:SummonItem(27731); 	--dark cloak of the sky
		e.other:AddEXP(100000);
		e.self:Say("Good work, ranger.");
		eq.depop();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20854, item2 = 20948, item3 = 20855})) then --ranger test of the element of earth using dragon-hide mantle, gridelin globe, spiroc earth totem
		e.other:SummonItem(2714); 	--earthshaker's mantle
		e.other:AddEXP(100000);
		e.self:Say("Good work, ranger.");
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
