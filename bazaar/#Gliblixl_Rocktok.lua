-- items: 17814, 10953, 10952
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail " .. e.other:GetName() .. "! I sell the finest quality ore imported from the mines of Norrath! It's difficult to keep enough ore available with the demands of the local smiths however and could use some [assistance] in restocking my supplies.");
	elseif(e.message:findi("assistance")) then
		e.self:Say("Hooray! Fill this crate with either four small bricks of unrefined ore or four large Bricks of unrefined ore from Norrath and I will pay you for your assistance in keeping me in business.");
		e.other:SummonItem(17814); -- Item: Empty Ore Crate
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 10953})) then
		e.self:Say("Thank you " .. e.other:GetName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Faction(1510, 10); -- Faction: House of Fordel
		e.other:Faction(1511, 10); -- Faction: House of Midst
		e.other:Faction(1512, 10); -- Faction: House of Stout
		e.other:Faction(1508, 10); -- Faction: Traders of the Haven
		e.other:Ding();
		e.other:AddEXP(250);
		e.other:GiveCash(0, 0, 0, 44);
		eq.spawn2(151057, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Gliblixl_Rocktok
		eq.depop_with_timer();

	elseif(item_lib.check_turn_in(e.trade, {item1 = 10952})) then
		e.self:Say("Thank you " .. e.other:GetName() .. "! I will prepare the ore for sale and be open for business again momentarily. Here is your payment for your services.");
		e.other:Ding();
		e.other:Faction(1510, 10); -- Faction: House of Fordel
		e.other:Faction(1511, 10); -- Faction: House of Midst
		e.other:Faction(1512, 10); -- Faction: House of Stout
		e.other:Faction(1508, 10); -- Faction: Traders of the Haven
		e.other:AddEXP(250);
		e.other:GiveCash(0, 0, 0, 14);
		eq.spawn2(151057, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: Gliblixl_Rocktok
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
