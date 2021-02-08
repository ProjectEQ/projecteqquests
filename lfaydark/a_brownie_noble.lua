-- items: 52944, 52948, 52940, 57921, 52952, 119184, 52946, 52957
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail") and e.other:Class()=="Enchanter") then 
		e.self:Say("Long time have your kind needed us, but never have we been close. Wouldn't you agree? I'm afraid I cannot help you without some token of faith");
	elseif(e.message:findi("faith")) then	
		e.self:Say("So long have we retained our distance, we have nearly been forgotten. Despite the fact that this allows us our peace, there are times I wish I could provide my people with the niceties of society. If you could obtain a few items for me I could help you with the knowledge you seek.");
	elseif(e.message:findi("items")) then	
		e.self:Say("I would very much like some Gnomish Candy, Koada'Dal Silk, Feir'Dal Champagne, and Dwarven Steel.");		
	end
end

function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 52944,item2 = 52948,item3 = 52940,item4 = 57921}) and e.other:HasItem(52952) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(119184) == false) then
		e.self:Say("Perhaps your intentions are true, after all. I have one shard of a purifying crystal that you will need for the task ahead of you. It is quite powerful, and I hate to part with it. I will give it to you, but only in trade. There is a harnessing stone possessed by a seeker in Kael. It is less powerful than the crystal, but should prove sufficient for my needs. Bring me this crystal and it shall be yours.");
		e.other:AddEXP(10000);
		eq.set_global("ench_epic","8",5,"F");
	end
	if(qglobals["ench_epic"] == "8" and item_lib.check_turn_in(e.trade, {item1 = 52946}) and e.other:HasItem(52952) and eq.get_entity_list():IsMobSpawnedByNpcTypeID(119184) == false) then
		e.self:Say("Very well, here is the fragment. I can only imagine at the power of the unified crystal.");
		e.other:AddEXP(10000);
		e.other:SummonItem(52957); -- Item: Purifying Crystal Fragment
	end	
	item_lib.return_items(e.self, e.other, e.trade)
end