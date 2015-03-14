-- Converted to .lua by Speedz
-- added saylink by robregen

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Away from carver Cagrek you get!! Me's a busy troll. Must punish enmees of Grobb and feeds trolls a plenty. Trolls complain meats no good, complains dey want sum [" .. eq.say_link("special bread",false,"special bread") .. "]. Dey says dey hears ogres have special meat which taste better den pris'ners of Grobb. Do you knows name of meat? What kinda [" .. eq.say_link("hehe meat",false,"meat") .. "] dat be? Tell me!!");
	elseif(e.message:findi("special bread")) then
		e.self:Say("It little known secret among trolls dat Cagrek know how to make tatsy bread from halfling. Dey say dere is plenty of dem out in the forest, ripe for the picking!! You bring carver Cagrek four of their tender little feet bones.");
	elseif(e.message:findi("hehe meat")) then
		e.self:Say("HEHE meat!! What dat stand for? Mes need some of dis HEHE meat!! Gos and get me some. Cagrek not just want some. Cagrek want more dan twenny!! Cagrek want three HEHE meat and mes want HEHE recipe. You get and me makes " .. e.other:GetName() .. " honeraree carver. Me gives you Grobb Cleaver. It cuts skins like dey butter!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 16183, item2 = 16183, item3 = 16183, item4 = 16183})) then
		e.self:Say("Whut tooks you so long!! Ah, dis please Cagrek as I can grind dese up to make special bread. Me get on that right away. Here is you reward, now out of Cagrek's way.");
		e.other:SummonItem(28243);
		e.other:Ding();
		e.other:Faction(131,15,0);
	elseif (item_lib.check_turn_in(e.trade, {item1 = 13368, item2 = 13368, item3 = 13368, item4 = 18940})) then
		e.self:Say("Finally!! What takes yous so long? Now carver Cagrek try and makes meat and feeds to trolls. Yous getting to be deputy carver. Mes give you Grobb cleaver!! Make strong and smarts on you it will. Just like carver Cagrek.");
		e.other:SummonItem(5413);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
