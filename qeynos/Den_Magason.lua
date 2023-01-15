-- items: 18006, 13784
function event_waypoint_arrive(e)
	if(e.wp == 16 or e.wp == 43 or e.wp == 70) then
		e.self:Say("Psst.. Hey, you there.. Yeah, you.. You need some [blank scroll sheets].. I just got a special shipment of things in.. Come on, it's just what you're looking for.. I know you.");
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Oh, hey there.. How ya doing? My name's Den. I work for ol' [Rohand] here, unloading the [shipments] that come in from overseas.");
	elseif(e.message:findi("rohand")) then
		e.self:Say("Ol' Captain Rohand is the owner of the Mermaid's Lure. He trades goods with sailors and sea [merchants]. I think that old man was even born at sea.. And he's got more stories than fish have scales.");	
	elseif(e.message:findi("shipments") or e.message:findi("merchants")) then
		e.self:Say("Yeah.. We get merchants and traders with goods from here to [Odus].");	
	elseif(e.message:findi("blank scroll sheets")) then
		e.self:Say("Blank scroll sheets, huh? You know, there seems to be a shortage of these around here lately. But, hey friend, ol' Denny-boy here would never steer you wrong. I'll sell you some for 2 gold. I know, I'm too kind.");
	elseif(e.message:findi("Odus")) then
		e.self:Say("Odus? I've never been there, but I hear it's a long journey.");
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
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13784})) then
		e.self:Say("All right, I'll make sure this gets put on the next boat to Erudin. But now, I need a favor of you. Since I'm stuck here working the docks all day, I need someone to run out to Qeynos Hills and bring me back various pelts and skins. I got a customer in Odus who is trying to get a new shop started, and he needs some samples. Bring me back some snake scales, a high quality bear skin, a high quality wolf skin, and some bat fur. Make sure the quality is good, I can't send him rags.");
		e.other:Ding();
		e.other:Faction(291,2,0); -- Faction: Merchants of Qeynos
		e.other:Faction(223,-2,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(219,2,0); -- Faction: Antonius Bayle
		e.other:Faction(229,2,0); -- Faction: Coalition of Tradefolk
		e.other:Faction(262,2,0); -- Faction: Guards of Qeynos
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
