function event_say(e)
	if(e.message:findi("megan")) then
		if(e.other:GetFaction(e.self) < 5) then
			e.self:Say("I heard she got lost on the plains. You should go ask her dog, Snowflake, where she is. I hear she is somewhere around the pass to Halas.");
		elseif(e.other:GetFaction(e.self) == 5) then
			e.self:Say("The Wolves o' the North show ye no ill will, but there's much ye must do t' earn our trust.  Perhaps ye should speak with Lysbith and inquire o' the [gnoll bounty].");
		else
			e.self:Say("Run while ye still can!! The Wolves o' the North will not tolerate yer presence!");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 13243})) then -- One Half Bottle of Elixir
		e.self:Say("Mmmm.. Thank you stranger. I feel a lot warmer now. You should now go and find [Megan] O'Reilly.");
		e.other:SummonItem(13244); -- One Quarter of Elixir
		e.other:Ding();
		e.other:Faction(213,1,0); -- Merchants of Halas
		e.other:Faction(294,1,0); -- Shaman of Justice
		e.other:Faction(311,1,0); -- Steel Warriors
		e.other:Faction(361,1,0); -- Wolves of the North
		e.other:AddEXP(150);
	end
	item_lib.return_items(e.self, e.other, e.trade);
end

function event_spawn(e)
	e.self:SetRunning(true);
end

-- END of FILE Zone:everfrost  ID:30049 -- Arnis_McLish