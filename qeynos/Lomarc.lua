-- items: 18006
function event_waypoint_arrive(e)
	if(e.wp == 16 or e.wp == 43 or e.wp == 70) then
		e.self:Say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Do I know you? Don't stick your nose where it don't belong. It might just get cut off.");
	elseif(e.message:findi("blank scroll sheets")) then
		e.self:Say("Blank scroll sheets, huh? You know, there seems to be a shortage of these around here lately. But, hey friend, ol' Denny-boy here would never steer you wrong. I'll sell you some for 2 gold. I know, I'm too kind.");
	end
end

function event_trade(e)
	local item_lib =require("items");
	if(item_lib.check_turn_in(e.trade, {gold = 2})) then
		e.self:Say("Yeah, well, these are pretty hard to come by. In fact, these came all the way from Odus. Enjoy, and tell your buddies.");
		e.other:Ding();
		e.other:SummonItem(18006); -- Item: Blank Scroll Sheets
		e.other:Faction(223,2,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,-2,0); -- Faction: Merchants of Qeynos
		e.other:Faction(230,2,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(262,-2,0); -- Faction: Guards of Qeynos
		e.other:Faction(273,2,0); -- Faction: Kane Bayle
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
