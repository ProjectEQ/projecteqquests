--shadowhaven/Koren_Galund.lua NPCID 150313
--Warrior Epic 1.5
function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 60318}) and qglobals["warrior_epic"] >= "13") then --Carved Keg Stamp
		e.self:Say("Excellent, the stamp I've been waiting for! I see you've met my brother. He's nice and a great gemsetter, but not altogether there, if you know what I mean. I really appreciate you doing this for me. Make sure you get this tube back to him. I'm sure he'll need it for whatever job you've got him working on. And be patient with him. He'll get his thoughts out eventually.");
		e.other:SummonItem(60319) --Tube of Setting Solution
	end	
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	