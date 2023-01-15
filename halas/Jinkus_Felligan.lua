-- items: 12621, 12619, 12620, 12622, 1376
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome! Welcome to the Church o' the Tribunal! Do ye require healing or are ye [new to the Shamans o' Justice], then, eh?");
	elseif(e.message:findi("new to the shamans")) then
		e.self:Say("Then I welcome ye into our noble order. Ye'll serve us well or spend an eternity in the dungeons o' the Tribunal. Are ye willing to [contribute to our church] or did ye just come to meditate within our walls?");
	elseif(e.message:findi("contribute")) then
		e.self:Say("Well then, ye best be off ta find Holana Oleary, she organises our monthly Karan Clover shipments, just tell her Jinkus sent you to assist her. Or, I can have you [make a delivery] for me."); --made up text
	elseif(e.message:findi("make a delivery")) then
		e.self:Say("Excellent! First, visit Cindl and tell er ye need a Mammoth Hide Parchment. Then, I need ye to visit Greta and tell her you need some ink. Bring these back to me and we will continue from there.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12621, item2 = 12619})) then 		--Mammoth Hide Parchment, Vial of Datura Ink
		e.self:Say("Good, now you must take this wanted poster i made to Guard Eracon Krengon in Southern Qeynos. Bring me back the Most Wanted List...");
		e.other:SummonItem(12620);													--Wanted Poster
		e.other:Ding();
	elseif(item_lib.check_turn_in(e.trade, {item1 = 12622})) then	--List of Qeynos Most Wanted
		e.self:Say("Fantastic, Fantastic... Here you have more than proven your right to wear this. Use it wisely...");
		e.other:SummonItem(1376); 													--Initiate Symbol of the Tribunal
		e.other:Faction(5002,2);  													--Banker
		e.other:Faction(328,2);  													--Merchants of Halas
		e.other:Faction(327,2);  													--Shamen of Justice
		e.other:Faction(223,-3);  													--Circle of Unseen Hands
		e.other:Faction(336,-3);  													--Coalition of Tradefolk Underground
		e.other:Faction(5006,-3); 													--Hall of the Ebon Mask
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- DEVELOPER: KOVOU
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
