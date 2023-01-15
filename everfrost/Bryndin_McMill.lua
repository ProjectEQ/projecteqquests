-- items: 13242, 13243
function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13242})) then -- Three Quarters of Elixir
		e.self:Say("Ahhh!! I feel warm all over. Thanks. You should go give Arnis McLish a drink of this elixir. Last time I saw him he was headed toward Blackburrow.");
		e.other:SummonItem(13243); -- One Half Full Bottle of Elixir
		e.other:Ding();
		e.other:Faction(328,1,0); -- Merchants of Halas
		e.other:Faction(327,1,0); -- Shaman of Justice
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(320,1,0); -- Wolves of the North
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

-- END of FILE Zone:everfrost  ID:30065, 30115 -- Bryndin_McMill
