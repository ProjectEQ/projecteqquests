-- items: 18831, 13962, 2031, 2036, 2030, 2034, 2027, 2038, 2026, 2029, 2025, 2032, 2028, 2033, 5043, 6032, 6030, 7022, 7024, 94155, 6031, 2912
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hmph. Hello. how are ye an' how do ye do? Now. what are ye planning to buy?");
	elseif(e.message:findi("Jinkus sent me to assist you")) then
		e.self:Say("About time he get around to it. Hmph. What i be needing you ta do is head on over to Einhorst McMannus in the plains of the western karana region. Give him this and he should have the shipment ready. Bring it back to me when ye be done."); --made up text
		e.other:SummonItem(18831); 								-- Tattered Note identifying as Message to Clan McMannus
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 13962})) then	--Karana Clover Shipment
		e.self:Say("We can now rest assured that justice has been served. Ye'll be a valuable asset to our court.");
		local rewardr = math.random(10);
		e.other:GiveCash(math.random(99),math.random(99),math.random(99),0);
		e.other:AddEXP(1600);
		e.other:Ding();
		e.other:Faction(328,2); 								--Merchants of Halas
		e.other:Faction(327,2); 								--Shamen of Justice
		e.other:Faction(223,-3); 								--Circle of Unseen Hands
		e.other:Faction(336,-3); 								--Coalition of Tradefolk Underground
		e.other:Faction(5006,-3); 								--Hall of the Ebon Mask
		if(rewardr  < 4) then
			-- : Drowsy : Frost Rift : Sicken : Fleting Fury : Spirit of Bear : Cure Blindness : Spirit Sight : Scale Skin : Spirit Pouch : In that order
			local spellreward = eq.ChooseRandom(15270,15275,15075,15271,15279,15212,15079,15274,15272);
			local dialog0;
			local dialog1 = "Drowsy ";
			local dialog2 = "Frost Rift";
			local dialog3 = "Sicken";
			local dialog4 = "Fleeting Fury";
			local dialog5 = "Spirit o' the Bear"; --check dialog with alla or live
			local dialog6 = "Cure Blindness";
			local dialog7 = "Spirit Sight";
			local dialog8 = "Scale Skin";
			local dialog9 = "Spirit Pouch";
			if(spellreward == 15270) then
				dialog0 = dialog1;
			elseif(spellreward == 15275) then
				dialog0 = dialog2;
			elseif(spellreward == 15075) then
				dialog0 = dialog3;
			elseif(spellreward == 15271) then
				dialog0 = dialog4;
			elseif(spellreward == 15279) then
				dialog0 = dialog5;
			elseif(spellreward == 15212) then
				dialog0 = dialog6;
			elseif(spellreward == 15079) then
				dialog0 = dialog7;
			elseif(spellreward == 15274) then
				dialog0 = dialog8;
			elseif(spellreward == 15272) then
				dialog0 = dialog9;
			end
			e.self:Say("Take and remember this spell, " .. dialog0 .. ", I hope ye've attained the necessary skills to scribe it.  If not, I'm sure ye soon will. Go now, and serve justice.");
			e.other:SummonItem(spellreward);
		elseif(rewardr < 7) then
			e.other:SummonItem(eq.ChooseRandom(2031,2036,2030,2034,2027,2038,2026,2029,2025,2032,2028,2033));	-- Complete Set of Large Leather Items
		elseif(rewardr < 10) then
			e.other:SummonItem(eq.ChooseRandom(5043,6032,6030,7022,7024,94155,6031));							-- All SHM usable tarnished weaponry
		else
			e.other:SummonItem(2912); 																			-- Polar Bear Cloak
		end
	end
end

-- DEVELOPER: KOVOU
-- modified by Speedz, Edited by Robregen
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
