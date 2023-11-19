function event_say(e)
    if e.message:findi("Hail") then
        e.self:Say("Hello, ".. e.other:GetName() .. ".  It's nice to have you stop by.  Have you heard any news of the lost [scouts]?");
    elseif e.message:findi("scouts") then
        e.self:Say("Certainly you have heard?  When they first arrived here, volunteers were asked to go ahead and brave the unknown to establish a beachhead on the continent so that a magus could attune himself to the location and establish a magical link with the ship.  Without them we would not have been able to reach the shore safely at all.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end