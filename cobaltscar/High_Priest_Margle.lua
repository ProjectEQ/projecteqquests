-- items: 19022
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and qglobals["mage_epic_water1"] == "1") then	
		e.self:Say("Hello! I am the High Priest for the little village. I am in charge of communicating with our [" .. eq.say_link("Water God") .. "], Tiknonmanin.");
	elseif(e.message:findi("Water God") and  qglobals["mage_epic_water1"] == "1") then	
		e.self:Say("Tiknonmanin is our one true god. He protects us when we need, and we give him tithing of fish and whatever else we find in the waters. I am the only one allowed to call him, but there are many who ask me to call him so they can give him their reverence. From time to time, someone comes to challenge him in combat. He is very confident in his power, especially this close to the water, so he allows anyone who wishes to [" .. eq.say_link("challenge") .. "] him.");	
	elseif(e.message:findi("challenge") and  qglobals["mage_epic_water1"] == "1") then	
		e.self:Say("Well it has been some time. I guess I could allow a challenge, but you'll need to do something for me first. We've been having a tough time catching enough fish of late, and our bait supplies are running low. Bring us the meat from four ice burrowers. I'll call Tiknonmanin for you when you return.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);	
	if(qglobals["mage_epic_water1"] == "1" and item_lib.check_turn_in(e.trade, {item1 = 19022, item2 = 19022, item3 = 19022, item4 = 19022})) then
		e.self:Say("Tiknonmanin awaits your challenge.");
		eq.spawn2(117094,0,0,318,741,-22,180); --Tiknonmanin
	end
	item_lib.return_items(e.self, e.other, e.trade)	
end
