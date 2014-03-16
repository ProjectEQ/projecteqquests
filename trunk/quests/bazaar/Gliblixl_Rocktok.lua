function event_spawn(e)
	eq.set_timer("warning", 21480000);--Timer for 5 hours and 58 minutes
	eq.set_timer("despawn", 21600000);--Timer for 6 hours
end

function event_timer(e)
	if(timer == "warning") then
		e.self:Say("Running out of ore soon, get em while they're hot!");
		eq.stop_timer("warning");
	end
	if(timer == "despawn") then
		eq.depop_with_timer();
		eq.stop_timer("despawn");
	end
end


function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. "! I sell the finest quality ore imported from the mines of Norrath! It's difficult to keep enough ore available with the demands of the local smiths however and could use some [assistance] in restocking my supplies.");
	end
	if(e.message:findi("assistance")) then
		e.self:Say("Hooray! Fill this crate with either four small bricks of unrefined ore or four large Bricks of unrefined ore from Norrath and I will pay you for your assistance in keeping me in business.");
		e.other:SummonItem(17814);
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 10953})) then
		e.self:Say("Thank you " .. e.other:GetName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:AddEXP(250);
		e.other:Faction(152, 10);
		e.other:Faction(153, 10);
		e.other:Faction(154, 10);
		e.other:Faction(338, 10);
		e.other:GiveCash(0, 0, 0, 44);
		x = e.self:GetX();
		y = e.self:GetY();
		z = e.self:GetZ();
		h = e.self:GetHeading();
		eq.spawn2(151057, 0, 0, x, y, z, h);
		eq.depop_with_timer();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10952})) then
		e.self:Say("Thank you " .. e.other:GetName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:AddEXP(250);
		e.other:Faction(152, 10);
		e.other:Faction(153, 10);
		e.other:Faction(154, 10);
		e.other:Faction(338, 10);
		e.other:GiveCash(0, 0, 0, 14);
		x = e.self:GetX();
		y = e.self:GetY();
		z = e.self:GetZ();
		h = e.self:GetHeading();
		eq.spawn2(151057, 0, 0, x, y, z, h);
		eq.depop_with_timer();
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
