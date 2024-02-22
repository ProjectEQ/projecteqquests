-- Quest: Brain Bite (Concussion)
-- NPC's Involved: Despondo (Firiona Vie), a_human_skeleton (x3, Trakanon's Teeth, Karnor's Castle, City of Mist)
function event_say(e)
	if(e.message:findi("Hail")) then
		e.self:Say("Save my.. Soul.. Find.. Wizard.. Desp..");
	end
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 12963})) then -- Hand in Mardon's Bottle
		e.other:QuestReward(e.self,{itemid = 12966}); -- Bottle of swirling smoke (Mardon's soul)
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
