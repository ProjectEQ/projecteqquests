-- items: 52349, 52350, 52351, 52352, 301033
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So patronizing you are. Shoo! I have no need of your help and likewise - you have no need of mine.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if (qglobals["Fatestealer"] == "3" and item_lib.check_turn_in(e.trade, {item1=52349,item2=52350,item3=52351,item4=52352}) and not eq.get_entity_list():IsMobSpawnedByNpcTypeID(301033)) then 
		eq.set_global("rog_bf_trigger","1",3,"H1");
		eq.spawn2(301033,0,0,72,1749,-895,70); -- NPC: #a_reclusive_girplan
		eq.zone_emote(MT.Yellow, "Attracted by the recent commotion, a reclusive Girplan emerges from its hiding spot.");
	end
	item_lib.return_items(e.self, e.other, e.trade);
end
