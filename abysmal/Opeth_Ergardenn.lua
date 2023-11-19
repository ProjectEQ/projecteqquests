function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Welcome to the Queen. Watch yer step, the deck can be treacherous if you aren't careful. An' if ya see anything [dangerous], let me know.");
	elseif e.message:findi("dangerous") then
		e.self:Say("We're not sure what sorts of things might live in these waters or what might try ta come out from shore. So we're watchful for every kind of danger.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end