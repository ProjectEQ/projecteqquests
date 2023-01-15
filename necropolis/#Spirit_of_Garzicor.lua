-- items: 25814
function event_spawn(e)
	eq.set_timer("depop",900000);
end

function event_trade(e)
	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 25814}, 0)) then -- flawless diamond
		e.self:Emote("'s eyes flare with fanaticism as he snatches the gem from you and holds it to his chest desperately. Slowly, the spirit's form begins to draw itself into the gem, as water draws itself into a whirlpool. Soon there is nothing left but a charred remnants of the once flawless diamond.");
		e.other:QuestReward(e.self,0,0,0,0,2090,5000); -- Blackened Diamond
		eq.depop();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

function event_timer(e)
	eq.depop();
end
