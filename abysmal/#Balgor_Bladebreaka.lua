function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Ello dere ".. e.other:GetName() .. ", me want to welcome you to da Abysmal Sea. We be given dis area to offer our services to da Wayfarers Brotherhood, as well as others dat wish to further dere cause. We are here to provide direction and training for all in need. If you are looking for sumting specific, you may wants to speak wit da others here.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end
