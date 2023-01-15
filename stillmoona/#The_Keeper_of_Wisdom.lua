-- items: 49001, 49002, 49003, 49004
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("'Greetings, stranger. Have you come to partake in the [Trial of Wisdom]?'");
	elseif(e.message:findi("Trial of Wisdom")) then
		e.self:Say(" 'There are many riches to be had by those that possess the wisdom, strength, and perseverance to obtain them.  It is my duty to give the Trial of Wisdom.  Should you find the four scrolls of wisdom, return them to me and the trial shall commence.'");
	end
end

function event_trade(e)
	local item_lib = require("items");
	if(item_lib.check_turn_in(e.trade, {item1 = 49001,item2 = 49002,item3 = 49003,item4 = 49004})) then
		e.self:Say("'You may now proceed to the Test of Wisdom if you are ready.  Find the drake named Sung Li to begin.  He should be downstairs.  Tread wisely and you shall succeed.'");
		eq.spawn2(338168,0,0,218,458,-6.39,384); -- NPC: #Sung_Li
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
