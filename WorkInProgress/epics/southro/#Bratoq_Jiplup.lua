--southro/#Bratoq_Jiplup.lua NPCID 35152
--Shaman Epic Prequest
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["shaman_pre"] == "2") then
		e.self:Say("I'm going to hedge my bets and guess that you are here for my special vial? Takes me forever to make and is going to cost you 2000 platinum. Yes indeed.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {platinum = 2000}) and qglobals["shaman_pre"] == "2") then
		e.self:Say("As much as I do hate to part with these, I do hope you'll put it too good use and help the shaman of Norrath.");
		e.other:SummonItem(57991); --Clouded Glass Vial
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	