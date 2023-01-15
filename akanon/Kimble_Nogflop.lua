-- Converted to .lua by Speedz
-- items: 13945, 12140

function event_say(e)
	local fac = e.other:GetFaction(e.self);
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am the keeper of this zoo. I advise you to stay on the upper tiers to observe the animals.");
	elseif (e.message:findi("regurgitonic")) then
		if(fac <= 5) then	-- Indifferent or better
			e.self:Say("I formulate the Regurgitonic myself. My animals kept eating the occasional spectator here and there. Femurs and ribs kept getting stuck inside, not to mention a few platinum pieces. Sometimes my batch would come out wrong and the animals would go berserk!! I hope I got the formula right this time.");
		else
			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fac = e.other:GetFaction(e.self);
	if (item_lib.check_turn_in(e.trade, {item1 = 13945})) then	-- Item: Flask of Nitrates
		if(fac <= 5) then	-- Indifferent or better
			e.self:Say("The flask of nitrates I sent for!! As was the deal, here is my [Regurgitonic]. Give it to whoever may need it and they will surely cough up whatever may be inside them with no harm to them whatsoever.");
			e.other:SummonItem(12140); -- Item: Regurgitonic
			e.other:Ding();
			e.other:Faction(255,10,0); -- Faction: Gem Choppers
			e.other:Faction(288,2,0); -- Faction: Merchants of Ak`Anon
			e.other:Faction(333,2,0); -- Faction: King Ak`Anon
			e.other:Faction(238,-2,0); -- Faction: Dark Reflection
			e.other:Faction(1604,-1,0); -- Faction: Clan Grikbar
			e.other:AddEXP(100);
		else
 			e.self:Say("You must show a greater allegiance to the Gemchoppers before we can speak with you. Search the hills for rogue clockworks. Captain Compolten shall accept two of their blackboxes and you shall prove your loyalty to our hall.");
 			e.other:SummonItem(13945); -- Item: Flask of Nitrates
 		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
