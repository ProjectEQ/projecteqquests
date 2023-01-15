-- items: 13861, 13862
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13861})) then
		e.self:Emote("darts into the jar, or just darted past it!! The Knights of Truth do not tolerate people attempting to catch these fish!!");
		e.other:SummonItem(eq.ChooseRandom(13861,13862)); -- Item(s): Jar of Liquid (13861), Fish in a Jar (13862)
		e.other:Ding();
		e.other:Faction(281,-2,0); -- Faction: Knights of Truth
		e.other:Faction(271,1,0); -- Faction: Dismal Rage
		e.other:Faction(330,1,0); -- Faction: The Freeport Militia
		e.other:Faction(362,-2,0); -- Faction: Priests of Marr
		e.other:Faction(311,-2,0); -- Faction: Steel Warriors
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
