function event_say(e)
	if(e.message:findi("mistress anna")) then
		e.self:Say("Mistress!  Aptly named, that one.  You are speaking of the Highpass hussy.  That is what everyone calls her, at least behind her back, that is.  Just as Highpass, she is beautiful and frequently traveled.  I have heard rumors that Carson has been seeing her, but how can that be true?  He has Lady McCabe.  What else does he need?");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
