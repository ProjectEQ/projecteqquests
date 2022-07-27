--Shaman Skull Quest 6
-- items: 12752
function event_death_complete(e)
	e.self:Shout("the river of Xinth...");
end

function event_trade(e)
	local item_lib = require("items");
	--Turn in the a potion of swirling liquid
	if(item_lib.check_turn_in(e.trade, {item1 = 12752})) then
		e.other:QuestReward(e.self,0,0,0,0,12750); --give the player one of the Iksar skulls of the sisters...
		e.self:Shout("Go to where the pines have been smashed. Must reach great heights!");
		eq.depop_with_timer();
		-- an npc named, Friend Vagnar the Channeler, is supposed to spawn and shout that text while running away, figure this would b easier on the server...
	end
	item_lib.return_items(e.self, e.other, e.trade) --return items if not the ones required
end
