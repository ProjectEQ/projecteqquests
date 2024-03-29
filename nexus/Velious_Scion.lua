function event_say(e)
	if e.message:findi("hail") then
		e.self:Say("Greetings " .. e.other:GetName() .. ". I am here to assist and watch over those who wish to return to the continent of Velious. Due to the limited space I share this area with the portal to Odus. The [teleport system] back to Norrath is completely automated. I have no direct control over when the portal will turn on, although I can say that the system works on a schedule of approximately ten minutes.");
    elseif e.message:findi("teleport system") then
		e.self:Say("The teleport system is pretty simple from your perspective. Simply listen for the voice saying that the portals will become active soon. When the time nears, you should stand on the elevated pad you see next to me. Shortly after you see the message that the teleporters are active, you will be transported to your destination..");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end