function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13241})) then -- Full Bottle of Elixir
		e.self:Say("Mmmm.. I feel much warmer. Thank you. You should now find Bryndin McMill. He could use a swig also. I saw him hanging around two other guards.");
		e.other:SummonItem(13242); -- 3/4 Full Bottle of Elixir
		e.other:Ding();
		e.other:Faction(213,1,0); -- Merchants of Halas
		e.other:Faction(294,1,0); -- Shaman of Justice
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(361,1,0); -- Wolves of the North
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:everfrost  ID:30072 -- Talin_O`Donal