function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, " .. e.other:GetName() .. ". Feel free to browse my wares. Unless you are looking to make a special Oxidized robe. If so, just let me know that you want a [robe pattern]."); -- Still need real text
	elseif(e.message:findi("robe pattern")) then
		if(e.other:Race() == "Gnome") then
			e.self:Say("Very well. Take this pattern, and good luck to you Gnome."); -- Still need real text
			e.other:SummonItem(65192); -- Oxidized Robe Pattern
		else
			e.self:Say("You are not a Gnome! Who are you trying to fool?"); -- Still need real text
		end
	end
end	

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:akanon  ID:55154 -- Tesil_Gludien