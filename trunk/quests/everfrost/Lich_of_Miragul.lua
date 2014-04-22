function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Areeeeewwwww");
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 19072})) then -- handin phlactery
		eq.spawn2(30094, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- Spawn Miragul
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:everfrost  ID:3233 -- Lich_of_Miragul