function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Greetings, traveler.  Luckily there have been no reports of unusual fluctuations in the magical auras of the buoys.  If you see anything unusual, please report it to me immediately.  Such [fluctuations] could be very dangerous to all of us.");
    elseif e.message:findi("fluctuations") then
        e.self:Say("I must admit that nobody has seen any changes with the magical buoys, but [theory] tells us that the magic used to hold back the maelstrom could be damaged by the force of the magic it resists.  In all written history nobody has been able to breach this barrier, and it would be unwise to expect our attempt to do so to be perfect.");
    elseif e.message:findi("theory") then
        e.self:Say("It is a theory that I helped to develop.  The theory is sound, but we are still uncertain about the exact nature of these devices that Calliav and Nedaria designed.  For now, we are safe from the maelstrom, but please be watchful for any changes that might indicate danger.");
    end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end