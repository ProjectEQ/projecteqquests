function event_say(e)
	local soulbinder_lib = require("soulbinder");
	soulbinder_lib.say(e);	
	
	local qglobals = eq.get_qglobals(e.other)
	if(qglobals["druid_epic"] == "3" and e.message:findi("identify this mangled head")) then
		e.self:Say("We soulbinders do not deal in such foul magic, we purged that [" .. eq.say_link("one") .. "] from our ranks long ago.");
	elseif(qglobals["druid_epic"] == "3" and e.message:findi("one")) then
		e.self:Say("I will not talk about him and I assure you that none of our membership will. If you must know more, talk to a man named Caskin about his friend. I don't remember his last name. Now please go away and don't mention this again.");		
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade)
end
