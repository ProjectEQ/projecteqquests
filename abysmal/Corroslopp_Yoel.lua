function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("Get to work. There no time for silly ".. e.other:GetName() .. " to stand looking at Corro. You go find tings to do. Leave Corro to his [work].");
	elseif e.message:findi("work") then
		e.self:Say("Corro lift tings and put dem on other tings. Maybe Corro put a ting on you? Go away.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade);
end