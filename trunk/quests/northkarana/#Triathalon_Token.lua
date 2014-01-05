-- Custom script  for GM event, created by Shadowblade

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Quickly, %s!  Give me the shoes so that you may finish the race!",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 2300})) then
		e.self:Say("Here, take this to Eldarian over there as fast as you can!");
		e.other:SummonItem(20695);
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
