function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Yes Niera! Oh. Erm. Hi. I mean, uh. How are you?");
	elseif(e.message:findi("niera")) then
		e.self:Emote("blushes. 'She is, uh.. I don't know. I haven't been able to speak with her. She has many suitors, and I'm just another poor ranger. I spend my days here pretending to fish, to carve bows, but really I'm just waiting to catch a glimpse of her. I thought about adventuring into the world to find some kind of token to give her, to show her how I feel, but I can't tear myself away from here.'");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12774})) then
		e.self:Emote("blinks and looks at the flower. 'This is perfect. Thank you! I'm going to go over to her now. Erm, well, maybe I'll wait a week to let the uh.. beauty of the flower.. uhm.. blossom. Yes, that sounds good. Here, you take this painting. I don't need it now. I made it myself, she wouldn't like it anyways.'");
		e.other:SummonItem(20475);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
