-- items: 17600
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Spare 3 gold so I can get a decent meal for once, master?");
	elseif(e.message:findi("favor")) then
		e.self:Say("I found this pouch and do not know whose it is. I would be more than willing to part with it for 5 gold, since the owner would probably reward you more.");
	end
	
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {gold = 5})) then
		e.self:Say("Very good, master! Best of luck in locating the proper owner. Maybe try giving it to ol' Crow in North Qeynos. Everyone knows if you need to fence.. er.. find something in Qeynos, Crow is your man. He always seems to know who's missing what. I am off to get some food.");
		e.other:SummonItem(17600); -- Item: Tattered Leather Pouch
		e.other:Ding();
		e.other:Faction(223,10,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
		e.other:Faction(230,10,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(262,-10,0); -- Faction: Guards of Qeynos
		e.other:Faction(273,10,0); -- Faction: Kane Bayle
		e.other:AddEXP(200);
	elseif(item_lib.check_turn_in(e.trade, {gold = 3})) then
		e.self:Say("Thank you, kind master. I don't wish to trouble you further but I do have another [favor] to ask..");
		e.other:Ding();
		e.other:Faction(223,10,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,-10,0); -- Faction: Merchants of Qeynos
		e.other:Faction(230,10,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(262,-10,0); -- Faction: Guards of Qeynos
		e.other:Faction(273,10,0); -- Faction: Kane Bayle
		e.other:AddEXP(200);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
