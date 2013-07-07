function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("How are you doing this fine day?  I am sure you are an adventurer and I know adventurers are weighed down by excessive platinum coins.  Why not purchase something?");
	end
end

function event_trade(e)
	local item_lib =require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
