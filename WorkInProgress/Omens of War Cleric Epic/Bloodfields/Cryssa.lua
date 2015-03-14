-- Cleric 2.0 Epic Quest // Aegis of Superior Divinity NPC --Drogerin

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, it is nice to finally meet you. I've heard a good bit about you. Nice work with the Plasmatic Priesthood. I have been able to find precious little information about the Disciples activities here, but I am certain that they have a presence here. I am also fairly certain they have been meeting with the Muramites here in Discord, trying to officially join the army of Mata Muram. We need to find where they are hiding, the Muramites must have some way of contacting them, probably some sort of magical medallion. See if you can. . . coerce some Muramites into relinquishing this information. Return to me with what you find.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
		if(item_lib.check_turn_in(e.trade, {item1 = 9956, item2 = 10399, item3 = 10235})) then -- Top Section of an Engraved Signet // Bottom Section of an Engraved Signet // Center Section of an Engraved Signet
			e.self:Say("Interesting, this appears to be a charm of some sort. If I am correct you can use this to not only locate the camp, but to break whatever illusion they are using to hide it.");
			e.other:SummonItem(12080); -- Enchanted Signet of the Disciples given to player.
		elseif(item_lib.check_turn_in(e.trade, {item = 12433})) then
			e.self:Say("What is this? No. . . it can't be. Bring this to Omat as quickly as you can. He must see this.");
			e.other:SummonITem(12433); -- Dark Red Robe returned to Player.
		end
		item_lib.return_items(e.self, e.other, e.trade);
end