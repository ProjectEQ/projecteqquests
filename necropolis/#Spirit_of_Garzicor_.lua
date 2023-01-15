-- items: 25814
function event_spawn(e)
	eq.set_timer("depop",900000);
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 25814}, 0)) then -- flawless diamond
		e.self:Emote("'s ghostly hand takes the gem and clutches at it tightly. The spirit then looks towards the sky as it slowly begins to fade away. After a time, nothing is left but the gem, now glowly softly. You quickly take the gem from mid air before it to vanishes.");
		e.other:QuestReward(e.self,0,0,0,0,2091,5000); -- Gold Tinted Diamond
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end
