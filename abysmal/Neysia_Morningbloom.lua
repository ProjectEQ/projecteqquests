function event_say(e)
    if e.message:findi("Hail") then
        e.self:Say("Greetings. I can sell you supplies, if you have need or, I can even help you fix up that old Jeweler's [Kit] of yours. Additionally if you like I can convert the various grades of raw Nihilite for you. I will keep a small amount for our use. I will convert raw amber nihilite, raw crimson nihilite, raw indigo nihilite and raw shimmering nihilite.");
    elseif e.message:findi("Kit") then
        e.self:Say("We've been working on improving our ability to work with liquid precious metals. To do that, we've had to improve our kits. We've made them a bit larger, and added some reinforcements to help them resist the heat. I can make one for you, just find a turepta shell and two shimmering steel threads and hand them to me along with your Jeweler's Kit and I'll make you a new one.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	if item_lib.check_turn_in(e.trade, {item1 = 63838, item2 = 63838, item3 = 62481, item4 = 17912}) then -- Items: Shimmering Steel Thread x 2, Turepta Shell, Jeweler's Kit
		e.self:Say("Good work! Here is your new kit.");
		e.other:QuestReward(e.self,0,0,0,0,62480,1000); -- Reinforced Jeweler's Kit
	end
	item_lib.return_items(e.self, e.other, e.trade)
end