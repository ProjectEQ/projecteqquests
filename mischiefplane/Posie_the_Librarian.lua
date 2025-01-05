--[[Zone: Plane of Mischief
#Short Name: mischiefplane
#Zone ID: 126
#
#NPC Name: Posie the Librarian ]]


function event_say(e)
	if e.message:findi("Hail") then
		e.self:Say("SSH! do not disturb the library! It's ".. e.other:Race() .." like you who have ruined your own books, you won't ruin mine!");
	end
end

 
function event_trade(e)
    local item_lib = require("items");

    if item_lib.check_turn_in(e.trade, {item1 = 9510}) then -- Item: Library Card 
		e.self:Say("Ahh, you brought your card. Let's see here. " .. e.other:GetName() .. ", is it? Here's the only book we have stocked at the moment. It's missing the chapter on wealth but there's an excellent story about melting your clothing in a pot on page 11. It's a one of a kind story written completely in invisible ink. Enjoy!");
		e.other:QuestReward(e.self,0,0,0,0,17325,100); -- Item: Book of Mischief 
    end

	item_lib.return_items(e.self, e.other, e.trade);
end
