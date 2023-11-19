function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("I yelled at Calliav when I found Nedaria convulsing after he'd spoken to her. I have no idea what he did, but it's my job to protect her so I don't feel terrible for screaming at 'im! I fear his meddling may cost my dear friend Nedaria her life.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end