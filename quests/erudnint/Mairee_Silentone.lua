--  Hammer of the Ancients - ranger epic

function event_say(e)
	if(e.message:findi("ancient hammer")) then
		e.self:Say("Yes, the ancient hammer. I heard something about that. Do you mind if I take a look at it?");
	end
end



function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 20478})) then
		e.self:Emote("makes a few marks on the hammer, and all the while you can hear a muffled cursing coming from the hammer head. 'Yes, it is an ancient dwarf's hammer. Interesting artifact. I've marked it to keep it stable while you retrieve something for me. You need to travel to the Plane of Sky and find a swirling sphere of color. Bring it and the hammer back to me.'");
		e.other:Ding();
		e.other:SummonItem(20479);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 20479,item2 = 20494})) then
		e.self:Emote("holds the sphere and makes intricate marks and patterns on it, eventually turning the entire crystal clear. She rolls it across the hammer, raising a ringing sound in the room. 'There. Now take the hammer back to Kinlo. He'll know what to do from here. Good luck to you.'");
		e.other:Ding();
		e.other:SummonItem(20485);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- EOF zone: erudnint ID: 23019 NPC: Mairee_Silentone