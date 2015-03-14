-- ancient pattern subquest -- ranger epic

function event_trade(e)
	local item_lib = require("items");

	if (e.other:GetFaction(e.self) < 5) then -- amiable or better Keepers of the Art
		if(item_lib.check_turn_in(e.trade, {item1 = 20457})) then
			e.self:Say("Eh? What is this? A cracked earthen pot? Why in the nine hells would I need a crushed pot? Perhaps I could use it to not hold water! Why did you even bother me with this? Are you mentally deficient? Apparently. Oh, well, you're just a servant boy. Well, then, we'll make you useful, if just a little. Take this shopping list and go get my groceries. Take it to Nora in the tavern. She'll know what I need.");
			e.other:SummonItem(20458);
		elseif(item_lib.check_turn_in(e.trade, {item1 = 20459})) then
			e.self:Say("Ah, good. Here's a few copper and a receipt for services rendered. Now be off, I'm sure citizens across the land are in dire need of broken pots at right this moment.");
			e.other:SummonItem(20474);
			e.other:GiveCash(3,0,0,0);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF zone: felwitheb ID: 62018 NPC: Farios_Elianos