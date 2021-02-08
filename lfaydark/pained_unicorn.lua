-- items: 20691, 20692, 20693, 20694
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("snorts and stamps at the ground. An unusual angry glimmer enters the eyes of what should be one of Tunare's most peaceful creatures. Its coat seems slickened and filthy in places.");
	elseif(e.message:findi("corruption")) then
		e.self:Emote("tosses its head back, drool falling from its mouth. 'The priests of the sick channel filth and sickness into the lands. Too late did we notice to stop them. You can though. Here, in the ocean, and the underwater city of the old. Go to those places and find the corruptions. Bring them to me.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20691,item2 = 20692,item3 = 20693})) then
		e.self:Say("Take my horn, symbol of Faydwer, now cleansed, to the gnome priest. It is anathema to him, to the corrupt forces in his soul, channeled into him by his dark god and will release the grip of corruption on the land. He is close, I can feel it.");
		e.other:SummonItem(20694); -- Item: Gleaming Unicorn Horn
		e.other:Ding();
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
