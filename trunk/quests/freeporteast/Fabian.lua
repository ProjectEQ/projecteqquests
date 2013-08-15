function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings, merry gentlefolk! If you enjoy the music, please feel free to cross my palm with gold.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local fabian = eq.get_qglobals(e.other);

	if(item_lib.check_turn_in(e.trade, {gold = 2})) then
		e.self:Say("Rat spittle! Busted another string! You seem like a good music loving citizen, could you please run to the Wind Spirit's Song and grab me a fresh set of lute strings?");
		e.other:Ding();
		e.other:Faction(192, 5,0);
		e.other:Faction(184, 5,0);
		e.other:Faction(135, 5,0);
		e.other:Faction(273, -5,0);
		e.other:Faction(207, -5,0);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13709})) then -- Lute Strings
		if(fabian.SilverCoin ~= nil) then
			e.self:Say("'Many thanks, merry gentlefolk! Let me cross your palm in gratitude for your kindness.");
		else
			e.self:Say("'Many thanks, merry gentlefolk! Let me cross your palm in gratitude for your kindness. Hmmmm where did my lucky coin go?");
			e.other:SummonItem(13710); -- Etched Silver Coin
			eq.set_global("SilverCoin","0",5,"F");
		end
		e.other:Ding();
		e.other:Faction(192, 5,0);
		e.other:Faction(184, 5,0);
		e.other:Faction(135, 5,0);
		e.other:Faction(273, -5,0);
		e.other:Faction(207, -5,0);
		e.other:AddEXP(5000);
		e.other:GiveCash(0,20,10,1);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 13710})) then -- Etched Silver Coin
		e.self:Say("'My lucky coin! How did it get in there? Well, never mind that. You are an honest person and although honesty is its own reward, I feel obligated to return the favor. Take this to Dionna if you enjoy music. Farewell friend!");
		e.other:SummonItem(13708); -- Note From Fabian
		e.other:Ding();
		e.other:Faction(192, 5,0);
		e.other:Faction(184, 5,0);
		e.other:Faction(135, 5,0);
		e.other:Faction(273, -5,0);
		e.other:Faction(207, -5,0);
		e.other:AddEXP(5000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end