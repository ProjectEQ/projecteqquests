-- Cleric 2.0 Epic Quest // Aegis of Superior Divinity NPC --Drogerin
-- items: 9956, 10399, 10235, 12080, 12433

function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["cleric20"] ~= nil and qglobals["cleric20"] >= "2") then
		e.self:Say("Greetings, it is nice to finally meet you. I've heard a good bit about you. Nice work with the Plasmatic Priesthood. I have been able to find precious little information about the Disciples activities here, but I am certain that they have a presence here. I am also fairly certain they have been meeting with the Muramites here in Discord, trying to officially join the army of Mata Muram. We need to find where they are hiding, the Muramites must have some way of contacting them, probably some sort of magical medallion. See if you can. . . coerce some Muramites into relinquishing this information. Return to me with what you find.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);

	if (qglobals["cleric20"] ~= nil and qglobals["cleric20"] >= "2") then
		if(item_lib.check_turn_in(e.trade, {item1 = 9956, item2 = 10399, item3 = 10235})) then -- Top Section of an Engraved Signet // Bottom Section of an Engraved Signet // Center Section of an Engraved Signet
			e.self:Say("Interesting, this appears to be a charm of some sort. If I am correct you can use this to not only locate the camp, but to break whatever illusion they are using to hide it.");
			e.other:SummonItem(12080); -- Enchanted Signet of the Disciples given to player.
			eq.set_global("cleric20_darkdisciples", "1", 5, "F"); -- this lets us spawn the dark disciples, live doesn't seem to really care if you have the item, or maybe they flag you to not be able to spawn them anymore .. either way, this will be removed once you get your robe
		elseif(item_lib.check_turn_in(e.trade, {item1 = 12433})) then
			e.self:Say("What is this? No... it can't be. Bring this to Omat as quickly as you can. He must see this.");
			e.other:SummonItem(12433); -- Get the robe back
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
