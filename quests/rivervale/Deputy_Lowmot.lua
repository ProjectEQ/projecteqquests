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
		e.other:Faction(133, 4);
		e.other:Faction(208, 4);
		e.other:Faction(316, 4);
		e.other:Faction(218, 4);
		e.other:Faction(88, -8);
		e.other:AddEXP(1000); 
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end

--END of FILE Zone:rivervale  ID:19110 -- Deputy_Lowmot 
