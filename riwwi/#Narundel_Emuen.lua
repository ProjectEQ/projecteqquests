-- Rarundel's Memory

function event_trade(e)
	local item_lib = require("items");
		if (item_lib.check_turn_in(e.trade, {item1 = 67410})) then --Rarundel's Sealed Memory Box
			e.self:Say("The pain of losing my daughter has hurt me deeply. While my disapproval of Rasnil made her unhappy, I know that no matter what I decide she will understand and accept it. Please take this to her. Thank you for granting me just a few moments to think about how things used to be.");
			e.other:SummonItem(67411); -- Narundel's Decision
		end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I have nothing to say to the likes of you. They took her away from me and now I will never get her back. Oh why did they have to take my daughter from me?' Narundel bursts into tears. 'Rarundel, I am so sorry!");
	end
end
