-- items: 9181, 69979
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["paladin_epic"] == "9") then
		if(e.message:findi("hail")) then
			e.self:Say("Greetings " .. e.other:GetName() .. "!! Something interesting has happened in the last few weeks here. . .we found a vampire scouting Ak`anon, though no one knows why. He was captured and slayed, and I ended up buying his heart to keep as a token of his visit. Would you like the heart?! If you would, bring me a battery that allows me to recharge my Anizok Maximizing Device.")
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	
	if(qglobals["paladin_epic"] == "9" and item_lib.check_turn_in(e.trade, {item1 = 9181})) then --Mana Battery - Class Six
		e.self:Say("Good! You found a mana battery!! Here is the heart I owe you. Bye bye now!");
		e.other:SummonItem(69979); -- Item: Slain Vampire's Heart
	end
	item_lib.return_items(e.self, e.other, e.trade)
end