function event_signal(e)
	e.self:Say("Ooh yeah! So would I, honey.");
	eq.signal(1066,1);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Hello %s! Welcome to our humble little bakery. We just got a fresh shipment of supplies in, have a look around!",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib =require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
