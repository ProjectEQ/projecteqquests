-- Converted to .lua by Speedz
-- added saylink by robregen
-- Added quest for mushroom spores, removed Neriak era stuff and fixed faction.
-- items: 13368, 18940, 5413, 12191, 12210, 13409, 12211

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Away from carver Cagrek you get!  Me's a busy troll.  Must punish enmees of Grobb and feeds trolls a plenty.  Trolls complain meats no good.  Dey says dey hears ogres have special meat which taste better den pris'ners of Grobb.  Do you knows name of meat?  What kinda [meat] dat be?  Tell me!");
	elseif(e.message:findi("hehe meat")) then
		e.self:Say("HEHE meat!! What dat stand for? Mes need some of dis HEHE meat!! Gos and get me some. Cagrek not just want some. Cagrek want more dan twenny!! Cagrek want three HEHE meat and mes want HEHE recipe. You get and me makes " .. e.other:GetName() .. " honeraree carver. Me gives you Grobb Cleaver. It cuts skins like dey butter!!");
	elseif(e.message:findi("oven mittens")) then
		e.self:Say("Oven mittens?! Whut you need for? You no cook! If you be tinkin you a cook me will gives you oven mittens, but first you brings me tree, not wun or too, but tree froglok meats and also gives me ten gold. You do dis den you get Grobb oven mittens.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13368, item2 = 13368, item3 = 13368, item4 = 18940})) then
		e.self:Say("Finally!! What takes yous so long? Now carver Cagrek try and makes meat and feeds to trolls. Yous getting to be deputy carver. Mes give you Grobb cleaver!! Make strong and smarts on you it will. Just like carver Cagrek.");
		e.other:SummonItem(5413); -- Item: Grobb Cleaver
		e.other:Ding();
		e.other:AddEXP(100);
		e.other:Faction(235,30,0); -- Faction: DaBashers
		e.other:Faction(222,-4,0); -- Faction: Broken Skull Clan
	elseif (item_lib.check_turn_in(e.trade, {item1 = 12191, item2 = 12191, item3 = 12191, item4 = 12191})) then
		e.self:Say("Gud werk! Me already made, err, founds dung part of meal. Here we go. One fungus dung pie! Enjoys.");
		e.other:SummonItem(12210); -- Item: Fungus Spore Pie
		e.other:Ding();
		e.other:AddEXP(145); -- seen at level 1
		e.other:Faction(235,5,0); -- Faction: DaBashers
		e.other:Faction(222,-1,0); -- Faction: Broken Skull Clan
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13409, item2 = 13409, item3 = 13409, gold = 10})) then
		e.other:SummonItem(12211); -- Item: Grobb Oven Mittens
		e.other:Ding();
		e.other:AddEXP(145); -- seen at level 1
		e.other:Faction(235,2,0); -- Faction: DaBashers
		e.other:Faction(222,-1,0); -- Faction: Broken Skull Clan
	end

	item_lib.return_items(e.self, e.other, e.trade)
end
