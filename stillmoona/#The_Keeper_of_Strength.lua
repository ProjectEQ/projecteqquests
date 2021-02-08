-- items: 49007, 49008, 49009, 49010
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Emote("sniffs the air.  'I smell weakness.  You may think you are strong to have ventured this far, but we shall see. It is my duty to give the Trial of Strength.  Should you find the four scrolls of strength, return them to me and the trial will begin.  We will then see how the 'heroes' fare.");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 49007,item2 = 49008,item3 = 49009,item4 = 49010})) then
		e.self:Say("'You may now proceed to the Test of Strength if you feel you are ready.  Find the Spirit Keeper in the room where the Council of Five used to draw their battle plans.'");
		eq.spawn2(338169,0,0,141,711,43.70,384); -- NPC: #A_Spirit_Keeper
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
