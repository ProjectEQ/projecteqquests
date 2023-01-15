-- items: 13959
function event_say(e)
	if(e.message:findi("nice hat")) then
		e.self:Say(string.format("Thank you, It is worn with pride and is the symbol of the Rivervale Militia"));
	end
end

function event_trade(e)
local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13959})) then
		e.self:Say("Oh good!  Hey.  You are not Jillin..  Helping out Blinza huh?  She is quite a woman..  Yes indeed.  Quite a woman..  ah..  Oh sorry.  Here you go.  Thanks again.  Mayor Gubbin will be pleased.");
		e.other:GiveCash(7,0,0,0);
		e.other:Faction(263, 1); -- Faction: Guardians of the Vale
		e.other:Faction(286, 1); -- Faction: Mayor Gubbin
		e.other:Faction(355, 1); -- Faction: Storm Reapers
		e.other:Faction(292, 1); -- Faction: Merchants of Rivervale
		e.other:Faction(334, -1); -- Faction: Dreadguard Outer
		e.other:AddEXP(10); 
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

--END of FILE Zone:rivervale  ID:19110 -- Deputy_Lowmot 
