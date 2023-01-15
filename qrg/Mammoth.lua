-- items: 12140, 18809
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12140})) then
		e.other:SummonItem(18809); -- Item: Bayle List II
		e.other:Ding();
		e.other:Faction(343, 10,0); -- Faction: Surefall Protected Animals
		e.other:Faction(302, 10,0); -- Faction: Protectors of Pine
		e.other:Faction(272, 10,0); -- Faction: Jaggedpine Treefolk
		e.other:Faction(366, -30,0); -- Faction: Karana Bandits
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
