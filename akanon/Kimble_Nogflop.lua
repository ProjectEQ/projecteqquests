-- Converted to .lua by Speedz

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings! I am the keeper of this zoo. I advise you to stay on the upper tiers to observe the animals.");
	elseif (e.message:findi("regurgitonic")) then
		e.self:Say("I formulate the Regurgitonic myself. My animals kept eating the occasional spectator here and there. Femurs and ribs kept getting stuck inside, not to mention a few platinum pieces. Sometimes my batch would come out wrong and the animals would go berserk!! I hope I got the formula right this time.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 13945})) then -- Flask of Nitrates
		e.self:Say("The flask of nitrates I sent for!! As was the deal, here is my [Regurgitonic]. Give it to whoever may need it and they will surely cough up whatever may be inside them with no harm to them whatsoever.");
		e.other:SummonItem(12140);	-- Regurgitonic
		e.other:Ding();
		e.other:Faction(115,10,0); 	-- Gem Choppers
		e.other:Faction(210,10,0); 	-- Merchants of Ak'Anon
		e.other:Faction(176,10,0); 	-- King Ak'Anon
		e.other:Faction(71,-30,0); 	-- Dark Reflection
		e.other:Faction(39,-30,0); 	-- Clan Grikbar
		e.other:AddEXP(100);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
