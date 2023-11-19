function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hail. May Tunare guide your arrows. Have you any news from the continent? Have you heard anything about the [lost scouts]?");
	elseif e.message:findi("lost scouts") then
		e.self:Say("Just after the Queen of Thorns was held fast here in the middle of the maelstrom, some of my friends were sent to scout Taelosia. Only one returned, Falcin. If not for [Falcin], some of us would not have known that there was land beyond the magic veil out there. I desperately want to leave this ship and search for my lost companions, but I must remain to protect the ship. We must now rely on heroes such as yourself to rescue them.");
	elseif e.message:findi("Falcin") then
		e.self:Say("I don't know more than I've told you, except that Falcin is a hero to many of us. Perhaps you should talk to Fezbin if you want to learn more.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end