-- items: 18800, 13131
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Who are you? Did McNeal send you? If not, you would do yourself good to leave Gnasher alone. I have friends in high places.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18800})) then
		e.self:Say("Ah. Good for you! Here you are. Take this to McNeal, but next time there will be no stout if there are no weapons.");
		e.other:SummonItem(13131); -- Item: Case of Blackburrow Stout
		e.other:Ding();
		e.other:Faction(223,5,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
		e.other:Faction(230,5,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(262,-10,0); -- Faction: Guards of Qeynos
		e.other:Faction(273,5,0); -- Faction: Kane Bayle
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
