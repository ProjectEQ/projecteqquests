function event_say(e)
	if(e.message:findi("bloodsaber")) then
		e.self:Say("Oh, no. I knew this would happen one day. Please don't hurt me! I had very little to do with this plague, though it is quite a nice one, you must admit. I was just a courier. I'll come quietly. I don't want any trouble. My small contribution to the glory of Bertoxxulous has already been given but I certainly don't want to go to meet him just yet!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 2344})) then
		e.other:SummonItem(2369);
		eq.set_timer("depop",60000);
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text)
end

function event_timer(e)
	if(e.timer == "depop") then
		eq.depop();
	end
end
