function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  Have you been in the waters here?  They are terribly cold and very, very dark.  I suspect that's why they have been having trouble getting anyone to check the [traps].");
	elseif e.message:findi("traps") then
		e.self:Say("We placed some simple traps in the waters hoping that we could catch some of the native sea life for food.  We've had some success, but even the frogloks aboard are unwilling to go back into the water.  At this point, I guess whatever can be found in the traps can be kept by anyone willing to pry them open.  We get plenty of seafood from our [fishermen] anyhow.");
	elseif e.message:findi("fishermen") then
		e.self:Say("We have several.  They work hard enough, I suppose, but they sure do spend a lot of their time in the bar telling their tall tales and drinking.  Unless you're interested in having your ear talked off, I'd stay out of the tavern when they are taking their frequent breaks.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end