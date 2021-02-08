-- items: 17062, 2057, 2059
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("slowly looks up at you, his eyes glazed in exhaustion. Obviously the kobolds have worked him near to the point of death. You notice he is strong and his paws are scarred here and there. He must be some sort of craftsman. After gazing at you a few moments he realizes you are not a kobold and says, 'Hurry and leave this place, " .. e.other:Race() .. ". Or you'll end up sharing this cell with us and wishing death upon yourself' ");
	elseif(e.message:findi("help")) then
		e.self:Say("You need my help to build one? I can help you, but I'll need my tools first. Then maybe when I have my tools I can break out of this rusty cage and run. My tools were taken when they first captured me. They used to force me to use them, show them our craft. I showed them what I could, fearing death, but I haven't seen them since. If you can find them, bring them here along with a suitable plate of metal and a sketch of the tsuba's design. Then I'll see what I can do.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 17062,item2 = 2057,item3 = 2059})) then -- Kejekan Tool Kit, Mandala Sketch, Chronium Plate
		e.self:Emote("takes the tools, plate, and sketch wearily and begins carving the tsuba. It takes him many hours to finish it but the wait is worth it. The tsuba is beautifully crafted, matching the complicated sketch perfectly. Koajin says, 'There you go, " .. e.other:GetCleanName() .. ". It's a wonderful piece. I have no idea what the diagram is for, but it was a pleasure to craft it. Now if I can get myself out of here.");
		e.other:QuestReward(e.self,0,0,0,0,2055,5000); -- Finished Tsuba
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
