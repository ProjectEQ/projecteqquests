function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Breya Nostulia stares off into the distance in meditation. Her eyes are a light blue, much like the tropical waters of the ocean between Odus and the mainland. She ignores your greeting.");
	elseif(e.message:findi("tiam sent me")) then
		e.self:Say("Seems you've slain quite a few kobolds, then. This is good. You will need to kill many more to fulfill your quest. While the kobolds are fairly primitive, they are an ancient race and have learned to wield the powers of the spirits. This ability is the only thing that has kept us from eradicating them completely. We need you to find instruments of their craft.");
	elseif(e.message:findi("instrument")) then
		e.self:Say("There are two items we seek. The shamans carry medicine pouches in which they hold the materials of their craft. Only the more adept shamans are allowed to carry the pouches; seek them out. The other item we seek is of greater importance.");
	elseif(e.message:findi("other item")) then
		e.self:Say("The other is a magical bowl from which a highly skilled shaman may divine the future or diagnose illness. Only the wisest of the kobold shamans have the intelligence to use the bowls, or perhaps an outcast with powers that the other, larger kobolds fear. Bring me a kobold medicine pouch and the diviner's bowl and you shall be rewarded with the armor of our trusted knights and priests.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 17056,item2 = 1766})) then
		e.self:Say("Well done, " .. e.other:GetName() .. ". I had a feeling you would return victorious. Here is your reward, the Leggings of Midnight Sea. Wear them with pride for the Ocean Lord. If you are interested in aiding us further, you may want to ask Gans about his brother.");
		e.other:SummonItem(1762);
		e.other:Ding();
		e.other:Faction(79,2,0);
		e.other:Faction(145,2,0);
		e.other:Faction(143,-2,0);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end