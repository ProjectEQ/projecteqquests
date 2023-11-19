function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail, Wayfarer.  May Prexus bless you and all of us in this [sacred] place.");
    elseif e.message:findi("sacred") then
        e.self:Say("All the waters are sacred to Prexus.  And we certainly could never have brought this great ship to this place without his blessing.  Though, considering everything that has [happened] lately, I can only marvel that the lord of water still deigns to aid us.");
    elseif e.message:findi("happened") then
        e.self:Say("I am certain you are aware of the conflict that we have brought directly into the homes of the gods.  As you might expect if someone were to come into your home and cause a disturbance, you would not be pleased either.  It is my belief that the mighty Prexus remains an ally of mortals, and my worship of him does not wane.  I'm not one to preach, but with all that is portended it might be wise for more of us to avoid the arrogance that has become our demeanor, but those are just my thoughts on the matter, and I will delay you no further with my chatter.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end