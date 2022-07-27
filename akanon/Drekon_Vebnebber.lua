-- Converted to .lua by Speedz
-- items: 18837, 18838

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". It is grand to make your acquaintance. I am the in-house merchant-slash-file clerk. I have goods to offer and I handle all the Gemchopper paperwork. Thrilling, don't you think?");
	end
	if (e.message:findi("red")) then
		e.self:Say("Red 5 is rumored to be a haywire clockwork. They say he pieced himself back together and lives in the scrapyard. If he IS there, you must hunt him down and take his blackbox to Manik Compolten. Be careful, if Red 5 rebuilt himself, he may have rebuilt minions as well.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 18837})) then
		e.self:Say("Why, thank you. Hey!! This log indicates some messy business is going on at the scrapyard. Something happened to a group of gnomes. They never came out!! Go check out the scrapyard! I believe the rumors of [Red 5] are true.");
		e.other:Faction(255,5); -- Faction: Gem Choppers
		e.other:Faction(288,1); -- Faction: Merchants of Ak`Anon
		e.other:Faction(333,1); -- Faction: King Ak`Anon
		e.other:Faction(238,-1); -- Faction: Dark Reflection
		e.other:Faction(1604,-1); -- Faction: Clan Grikbar
		e.other:AddEXP(2000);
		e.other:Ding();
	elseif (item_lib.check_turn_in(e.trade, {item1 = 18838})) then
		e.self:Say("Oh my! It seems two of the obsolete duster models were not fully shut down. You must find them. They could be anywhere in Ak'Anon! After you destroy them, take their scraps to Sanfyrd Montop. He is the operator of the scrapyard.");
		e.other:Faction(255,5); -- Faction: Gem Choppers
		e.other:Faction(288,1); -- Faction: Merchants of Ak`Anon
		e.other:Faction(333,1); -- Faction: King Ak`Anon
		e.other:Faction(238,-1); -- Faction: Dark Reflection
		e.other:Faction(1604,-1); -- Faction: Clan Grikbar
		e.other:AddEXP(2000);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
