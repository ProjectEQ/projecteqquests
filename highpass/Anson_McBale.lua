function event_say(e)
	local fac = e.other:GetFaction(e.self);
	local class = e.other:Class();
	local level = e.other:GetLevel();
	
	if(fac <= 5) then
		if(e.message:findi("hail")) then
			e.self:Emote("looks at you suspiciously. 'Yeah? Whacha want?'");
		elseif(e.message:findi("see stanos") and class == "Rogue" and level >= 50) then
			e.self:Say("This better be important.");
			eq.spawn2(5088,0,0,336,10,45,225);
		end
	else
		e.self:Say("Go away! We don't have time for the likes of you.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 28014}) and e.other:GetClass() == "Rogue" and e.other:GetLevel() >= 50) then
		e.self:Say("Oh, I see.");
		eq.spawn2(5088,0,0,336,10,45,225);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
