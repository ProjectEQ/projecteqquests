-- items: 17878, 2417
function event_say(e)
	local qglobals = eq.get_qglobals(e.self,e.other);

	if(e.message:findi("hail")) then
		e.self:Say("Hello " .. e.other:GetName() .. "");
	end
	if(qglobals["Ruathey"] ~= nil) then
		if(e.message:findi("sword")) then
			e.self:Say("I've heard stories about a holy sword. There are many rumored to be hidden all throughout the world, yet only a few have actually been found. Amstaf had one of these swords. It is known for its ability to dismiss the undead. Perhaps by having this sword it'll bring you closer to finding your friend. Gather a ghoul's heart, Amstaf's Scroll, the Blade of Nobility, a noblemans hilt and place them in this [bag].");
		elseif(e.message:findi("bag")) then
			e.self:Say("Take this bag and gather the items I've mentioned. I've been told that the Ghoul's Heart can be found in the estate of the undead, while the scroll can be found in the Keep not far from the Karanas. One of the others are rumored to be found near the dwarven city among the goblins. While the last should be found in the caverns of Najena.");
			e.other:SummonItem(17878); -- Noblemans bag
			eq.delete_global("Ruathey");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 2417})) then
		e.self:Say("I see that you've spoken to Llara. She too came to me looking for Amstaf. Though she wasn't able to find her friend, she was able to recover his [sword].");
		e.other:Ding();
		eq.set_global("Ruathey","ghoul",0,"D30");
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
