-- items: 12105, 12104
function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello. Nice to make your acquaintance. Be careful in the plains. There are many creatures. Just stay close to the guard towers.");
	elseif(e.message:findi("follower of karana")) then
		e.self:Say("Yes. I am a follower of Karana, the Rainkeeper. It is He who keeps the plains fertile.");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 12105})) then
		e.self:Say("May the Rainkeeper keep you safe. I thank you. Here is the empty chalice. By the way, inform your superior that the operations of the [Karana bandits] are getting closer to Qeynos.");
		e.other:SummonItem(12104); -- Item: Empty Chalice
		e.other:Ding();
		e.other:Faction(345,1,0); -- Faction: Karana Residents
		e.other:Faction(280,1,0); -- Faction: Knights of Thunder
		e.other:Faction(262,1,0); -- Faction: Guards of Qeynos
		e.other:Faction(341,1,0); -- Faction: Priests of Life
		e.other:AddEXP(500);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
