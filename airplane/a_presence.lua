function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("ignores you.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if((item_lib.check_turn_in(e.trade, {item1 = 1684})) and (e.other:GetLevel() >= 46) and (e.other:Class() == "Monk")) then
		e.self:Say("Hahaha! That dolt Eejag fell to the likes of you? Im not surprised. So, I guess this means you are here to challenge me. Normally, I wouldnt waste my time, but since you have defeated my younger brother, I suppose Im obligated.");
		eq.depop_with_timer();
		eq.spawn2(71069,0,0,e.self:GetX(),e.self:GetY(),-8,e.self:GetHeading());
	else
		e.self:Say("I have no need for this, " .. e.other:GetName() .. ".");
		item_lib.return_items(e.self, e.other, e.trade)
	end
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
