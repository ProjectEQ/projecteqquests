function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Welcome aboard the Queen of Thorns.  Hopefully you'll keep yourself out of trouble.  There's too much to [worry about] out here without some hero trying to stir things up.");
	elseif e.message:findi("worry about") then
		e.self:Say("It's my job to do the worrying.  Several of us patrol the ship to make certain that nothing goes wrong, and that includes adventurers that get out of hand.  We haven't had trouble from inside or out yet and I believe that the reason for that is diligence by those of us on guard.' Xilis eyes you suspiciously.  'Well, you don't seem like a trouble maker.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end