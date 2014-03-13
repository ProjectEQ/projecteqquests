-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("You look like you could use a copy of the Tinker's News and World report. " .. e.other:GetName() .. ". Find out everything that is happening both below ground and above. Buy a copy now. It's cheap.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
