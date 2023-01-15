-- items: 12619
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You will have to excuse me. I am quite busy.");
	elseif(e.message:findi("some ink")) then
		e.self:Say("Oh, sure. Here you go."); 	--Text made up
		e.other:SummonItem(12619); 				--Vial of Datura Ink
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- DEVELOPER: KOVOU
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd and manual edits by Speedz
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
