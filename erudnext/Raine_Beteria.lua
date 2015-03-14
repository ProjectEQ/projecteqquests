function event_say(e)
	if(e.message:findi("hail")) then 
		if(e.other:GetFaction(e.self) <= 5) then
			e.self:Say("Welcome. I am Raine Beteria.");
		else
			e.self:Say("You are lucky to be standing. Leave here immediately or suffer grave consequences! You are not welcome amongst the Craftkeepers.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(e.other:GetFaction(e.self) <= 5) then
		if(item_lib.check_turn_in(e.trade, {item1 = 6339,gold = 50})) then
			e.self:Say("Your silver wand has been fully enchanted. Take it and the pouch of silver dust back to the temple of Ro.");
			e.other:SummonItem(6340);
			e.other:Ding();
			e.other:AddEXP(1000);
		elseif(item_lib.check_turn_in(e.trade, {item1 = 10792})) then
			e.self:Say("Thank you very much. I have always wanted one of these! Hehehe? Just kidding. I see that you have enchanted this coin. I have placed the final enchantment on it - take it back to Romar.");
			e.other:SummonItem(10793);
			e.other:Ding();
			e.other:AddEXP(200000);
		end
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
