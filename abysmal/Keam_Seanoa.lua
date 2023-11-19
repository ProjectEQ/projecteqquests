function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello there.  It's nice to see you.  Have you been on board [long]?");
    elseif e.message:findi("long") then
        e.self:Say("Interesting.  I've been here for a while.  I didn't travel with the original crew, I was too busy scouting for those augmentation stones.  I'm still a bit shocked about how they've used them to get us here.  I wonder where they came from and why they have the power to affect that magical storm out there. How does the silly Grozmok rock fit into all of this?  If you figure it all out, please let me know.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end