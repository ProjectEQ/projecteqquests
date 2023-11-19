function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello.  Have you had a chance to see the new continent?  I've been their briefly, though my [duties] require that I remain here most of the time.");
    elseif e.message:findi("duties") then
        e.self:Say("Various things.  Primarily, I'm here to help out in any emergency, such as a failure of the buoys, though I think that is unlikely.  Should anything attack the ship, I'm also here to provide magical support to the guards in defense of this [wooden ship].");
    elseif e.message:findi("wooden ship") then
        e.self:Say("Oh, it's just that a proper ship is made of metal.  Any gnome knows that.  Good steel is always better than ratty ol' wood.  And steam power is far more reliable than wind!  Though it's not wind that motivates this ship, it's magic.  I'd much rather it were steam-powered.  I can't complain, though.  For what it is, this pulpy craft has held up, and I'm grateful for that.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end