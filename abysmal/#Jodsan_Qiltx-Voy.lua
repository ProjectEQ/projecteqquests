function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Hello there, ".. e.other:GetName() .. ", welcome to the Abysmal Sea. We have been given this area here to offer our services to the Wayfarers Brotherhood, as well as any others who wish to further their cause. We are here to provide direction and training for all in need. If you are looking for something specific, you may want to speak with some of the others here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
