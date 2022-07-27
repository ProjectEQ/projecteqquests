-- Part of quest for Veeshan's Peak key
-- items: 19956, 19957, 19958, 19953

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So long ago... The burning of our land?");
	elseif(e.message:findi("burning")) then
		e.self:Say("Fiery death from the sky. Rock and fire burning our lands. Death and destruction splintering our tribe. Once, strong we were, but the fiery rocks from the sky crushed our proud cities and weakened our tribe.");
	elseif(e.message:findi("tribe")) then
		e.self:Say("Obulus was our people. The hills and trees were our lands. We tamed the dark and wilds and bent the forests to our needs. But all is gone, all our people, all our works, even the medallion that was the symbol of our power.");
	elseif(e.message:findi("medallion")) then
		e.self:Say("Medallion of the Obulus. Symbol of our proud people. Broken into pieces long lost to the dark forests now. I know where they are now but I am no longer flesh. If I were, I would find them and bring them back together.");
	elseif(e.message:findi("pieces")) then
		e.self:Say("Hhhhh. Three pieces there are. One sits in the hands of Sselot though he knows its purpose not. Another sits upon an iksar ghost in Trakanons. The last is held by a long rotted iksar skeleton in the Dreadlands. Bring them all here and I may be able to unite them again. Perhaps this will even free me from my torment... or not.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 19956, item2 = 19957, item3 = 19958})) then --Piece of a Medallion (Bottom, Middle, Top)
		e.self:Say("Ssssss. I thought I would never see these. I never thought the symbol of our people would be made whole again. I feel no rest for my sssoul though. My torment still flows as freely as when my peoples first suffered fiery death. I need this not. It is useless to me. Here, you take it. Maybe you can find some good to do with it.");
		e.other:SummonItem(19953); -- Item: Medallion of the Obulus
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- Quest by mystic414
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
