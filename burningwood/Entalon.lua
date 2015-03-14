function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("smiles at you with a wide grin. 'You are quite brave to approach me and speak. On any other day, I would not give you the opportunity. Fortunately for you, I am preoccupied with my master's [quest].'");
	elseif(e.message:findi("quest")) then
		e.self:Say("I have but a small task, to find the scribblings of Jarldyn. A Fier'Dal has stolen them. The scribblings will be illegible, but they must be returned to my master who has rightfully won them in battle. If you find them, bring them to me with an emerald plume and I will grant you an audience with my master. Be forewarned, it may be a one way trip.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 12990, item2 = 12755})) then --Scribblings, Stoneleer Emerald Plume
		e.self:Say("Ha ha ha!! Fool! I have what I need. Now you are granted an audience with a noble sarnak lord, not my master. I am quite sure he shall do away with you. Ha ha ha!!");
		e.other:Ding();
		e.other:AddEXP(5000);
		e.other:MovePC(87,-4039,6280,-53); --Atheling Plague's Tower
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
