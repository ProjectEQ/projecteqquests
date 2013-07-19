function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to Top of the World, the newest shop in the pass!");
	elseif(e.message:findi("never stop chopping")) then
		e.self:Say("Never stop chopping?!!' Hey! I engraved that on a special order for a fellow Highpass citizen. I can't remember his name. He gave me not only some rare gems for it, but also a case of something called 'Lumberjack Pale Ale.' Great stuff!!");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
