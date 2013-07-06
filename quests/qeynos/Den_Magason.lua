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
		e.other:SummonItem(18006);
		e.other:Faction(33,2,0);
		e.other:Faction(217,-2,0);
		e.other:Faction(53,2,0);
		e.other:Faction(135,-2,0);
		e.other:Faction(164,2,0);
		e.other:AddEXP(200);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
