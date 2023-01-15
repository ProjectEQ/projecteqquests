-- items: 18822, 13926
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hail. citizen!  I am very busy. I do not have time to speak with you.  If you have any complaints. please direct them to City Hall.  Unless. of course. you have some personal business in which I might be interested.");
	elseif(e.message:findi("shrine of innoruuk")) then
		e.self:Say("It is about time Pietro sent someone. You people should be lucky I allow you to conduct your business in this city. I will have you all locked up if you cannot be more prompt. Now, listen up! I want you to go out to the Commonlands. My guards have reported that a messenger from Qeynos is staying at an inn near the western edge of the Commonlands. I suspect he is carrying vital information to the Hall of Truth. I want him stopped. Bring me the message if you know what's good for you and the Dismal Rage. Now, get out of here!");
	end
end

function event_death_complete(e)
	eq.spawn2(9147, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(),e.self:GetHeading()); -- NPC: #Sir_Lucan_D`Lere
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 18822})) then
		e.self:Say("So I see you decided to bring me the message. Good. I would hate to have to hunt you down. It could have gotten really messy and I hate reading bloodstained messages. Well it seems Antonius Bayle and the Knights of Truth have begun an alliance. And it sounds as though I may have a traitor among my guards. If you wish to switch your allegiance to Freeport, then find me this traitor. Bring me his militia tunic. Try to keep the blood from staining it.");
		e.other:Ding();
		e.other:Faction(330,10,0); -- Faction: The Freeport Militia
		e.other:Faction(336,10,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(281,-20,0); -- Faction: Knights of Truth
		e.other:Faction(362,-20,0); -- Faction: Priests of Marr
		e.other:AddEXP(5000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13926})) then
		e.self:Say("Thank you for your loyalty"); -- need live text and reward
		e.other:Ding();
		e.other:Faction(330,10,0); -- Faction: The Freeport Militia
		e.other:Faction(336,10,0); -- Faction: Coalition of Tradefolk Underground
		e.other:Faction(281,-40,0); -- Faction: Knights of Truth
		e.other:Faction(362,-40,0); -- Faction: Priests of Marr
		e.other:AddEXP(7500);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:freportw  ID:9018 -- Sir_Lucan_D`Lere
