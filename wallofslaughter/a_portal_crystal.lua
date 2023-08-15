function event_trade(e)
	local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 = 77645})) then	-- ice crystal
    eq.signal(300085,1);
    eq.local_emote({e.self:GetX(), e.self:GetY(), e.self:GetZ()}, MT.White, 100,"The shard clicks into place and the crystal begins to pulse with energy.");
  end
  item_lib.return_items(e.self, e.other, e.trade)
end
