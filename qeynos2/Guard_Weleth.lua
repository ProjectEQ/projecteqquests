-- items: 13925, 18824
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hail, %s. My name is Weleth Nagoh. In addition to my patrol, I am in charge of keeping the guardhouse stocked with supplies. I must get back to my duties. Farewell.",e.other:GetName()));
	elseif(e.message:findi("crate")) then
		e.self:Say("Oh, we just received a shipment of arrows from [Nesiff] in South Qeynos. The arrows in this box are missing their fletchings and I can't leave my patrol to take them back.");
	elseif(e.message:findi("nesiff")) then
		e.self:Say("Nesiff Tallaherd owns the wooden weapons shop in Merchant's Square in South Qeynos.");
	elseif(e.message:findi("arrows")) then
		e.self:Say("Oh, thank you! Here is the crate. Make sure [Nesiff] sends me back a new invoice. [Lieutenant Dagarok] would have my head if he found out this happened again!");
		e.other:SummonItem(13925); -- Crate of Defective Arrows
	elseif(e.message:findi("lieutenant dagarok")) then
		e.self:Say("Lieutenant Dagarok is the officer in charge of all of North Qeynos. He is difficult to get along with and I [do not trust] him.");
	elseif(e.message:findi("trust")) then
		e.self:Say("Late one night not long ago, after I was off duty, I witnessed Lieutenant Dagarok and a few others slay someone they claimed was a suspected necromancer. I had met their victim the day before and I know he was an innocent paladin from Freeport. What really shocked me was that Dagarok was bathed in an evil green glow as their victim crumpled to the ground. I don't know who to trust any more!");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18824})) then -- Slip of Parchment
		e.self:Say("Thank you so much for the favor. Please be careful here in Qeynos. I have come to suspect that even some of my fellow guards are not to be trusted - Lieutenant Dagarok, for one.");
		local random_cp = math.random(8);
		e.other:Ding();
		e.other:Faction(262,10,0); -- Guards of Qeynos
		e.other:Faction(219,10,0); -- Antonius Bayle
		e.other:Faction(223,-20,0); -- Circle Of Unseen Hands
		e.other:Faction(230,-20,0); -- Corrupt Qeynos Guards
		e.other:Faction(291,10,0); -- Merchants of Qeynos
		e.other:AddEXP(8000);
		e.other:GiveCash(random_cp,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_waypoint_arrive(e)
	if(e.wp == 8) then
		e.self:Say("Argh. Not again. This whole crate needs to be returned!");
	end
end
