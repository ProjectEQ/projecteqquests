function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Good day. " .. e.other:GetName() .. ". I assist in maintaining an accurate collection of historical tomes here in the great library of Erudin. One of our citizens recently escaped the dungeons of the Kobold warrens and tells of a Kobold lore keeper who keeps a collection of scrolls detailing the history of their kind. Are you capable of obtaining those scrolls for our library?");
	elseif(e.message:findi("am capable")) then
		e.self:Say("Take this case and return it to me when you have collected all of the scrolls.");
		e.other:SummonItem(17058);
	end
end
 
 function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 31825})) then
		e.self:Say("You have my gratitude, " .. e.other:GetName() .. "! This will make a valuable addition to our historical volumes and perhaps offer some insight into the workings of Kobold society.");
		e.other:Ding();
		e.other:Faction(211,5,0);
		e.other:Faction(145,5,0);
		e.other:Faction(147,5,0);
		e.other:AddEXP(1500);
		e.other:GiveCash(50,0,0,0);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:erudnext  ID:98015 -- Weltria_Ostriss