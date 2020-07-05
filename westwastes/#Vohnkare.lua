-- items: 52965, 52952, 119184, 52956
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and e.other:Class()=="Enchanter") then 
		e.self:Say("What do you seek mortal?");
	elseif(e.message:findi("crystal")) then	
		e.self:Say("Such great power for such a small being. I see that you are strong despite your size, however I fear for our world as I see such potent tools coming together. I fear a great battle is upon us. Enough of my rambling, I do have such a crystal. Bring me some volatile vampyre blood from the Tenebrous Mountains and I will part with it. It has been too long since I have had servants to fetch me such things.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52965}) and e.other:HasItem(52952) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(119184) == false) then
		e.self:Say("This will do quite nicely. Are you aware of the properties of vampyre blood? It can make such lovely protective concoctions. Why, I once fended off . . . There I go again. Here is your crystal, make haste!");
		e.other:AddEXP(10000);
		e.other:SummonItem(52956); -- Item: Purifying Crystal Fragment
	end
	item_lib.return_items(e.self, e.other, e.trade)
end