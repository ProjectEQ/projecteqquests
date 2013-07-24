function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the words of Marr be passed on to you.  Please seek knowledge from the masters of this temple.");
	elseif(e.message:findi("hail")) then
		e.self:Say("The Sisterhood of Erollisi is a band of female warriors. Their founders hail from Kelethin. They now train and live upon an island in the Ocean of Tears. We often check up on them. We share the same deity.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12133})) then
		e.self:Say("Thank you. I believe you need to seek out Sentry Xyrin. She is not at the temple. I believe she left to speak with [Sisterhood of Erollisi]. She was to speak with Styria.");
		e.other:SummonItem(12134);
		e.other:Ding();
		e.other:Faction(258,5,0);
		e.other:Faction(105,-10,0);
		e.other:Faction(184,5,0);
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
