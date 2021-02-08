-- items: 12133, 12134
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("May the words of Marr be passed on to you.  Please seek knowledge from the masters of this temple.");
	elseif(e.message:findi("sisterhood of erollisi")) then
		e.self:Say("The Sisterhood of Erollisi is a band of female warriors. Their founders hail from Kelethin. They now train and live upon an island in the Ocean of Tears. We often check up on them. We share the same deity.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12133})) then
		e.self:Say("Thank you. I believe you need to seek out Sentry Xyrin. She is not at the temple. I believe she left to speak with [Sisterhood of Erollisi]. She was to speak with Styria.");
		e.other:SummonItem(12134); -- Item: Last of Potion of Marr
		e.other:Ding();
		e.other:Faction(362,5,0); -- Faction: Priests of Marr
		e.other:Faction(330,-10,0); -- Faction: The Freeport Militia
		e.other:Faction(281,5,0); -- Faction: Knights of Truth
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
