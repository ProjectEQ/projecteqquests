-- Custom script  for GM event, created by Shadowblade
-- items: 21800, 2300

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Congratulations %s! If you turn in your horse I have something that will help you on the rest of your journey.",e.other:GetName()));
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 21800})) then
		e.self:Say("Perfect!  Here take these and finish the race! Remember to give this to my friend at the end to receive your proof of completing the race!");
		e.other:SummonItem(2300); -- Item: Journeyman's Boots
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
