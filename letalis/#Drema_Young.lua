-- items: 69945, 69946, 69949
function event_trade(e)
	local qglobals = eq.get_qglobals(e.other);
	local item_lib = require("items");

	if(qglobals["paladin_epic"] ~= nil and qglobals["paladin_epic"] >= "4" and item_lib.check_turn_in(e.trade, {item1 = 69945})) then
		e.self:Emote("groans, 'Uuuurgh. . . Crystal. . .' As Drema reaches out to receive the locket, her fingerbone breaks off in your hand.");
		e.other:SummonItem(69946); -- Item: Drema's Fingerbone
	end
	if(qglobals["paladin_epic"] ~= nil and qglobals["paladin_epic"] >= "5" and item_lib.check_turn_in(e.trade, {item1 = 69949})) then
		e.self:Emote("Please end my torment " .. e.other:GetName() .. ". I beg of you!");
		eq.unique_spawn(169128,0,0,-1278,825,0,0); -- NPC: Drema_Young
		eq.depop_with_timer();
	end	
	item_lib.return_items(e.self, e.other, e.trade);
end
