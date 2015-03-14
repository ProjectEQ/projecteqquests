-- no response on hail from live

function event_trade(e)
	local item_lib = require("items");

	if(item_lib.check_turn_in(e.trade, {item1 = 1772,item2 = 14585})) then -- sealed parchment, Odd Cold Iron Necklace
		e.self:Say("Ah..yes, I have seen this symbol before. There is a kobold that lives among the gnomes of Ak'anon. He may be reluctant to speak with you but you have no need to fear him. He is a follower of Brell Serilis and a valuable source of information on kobold society and culture. I will construct a message for him. Deliver the message and necklace and perhaps he can enlighten you to its meaning.");
		e.other:SummonItem(14585); -- Odd Cold Iron Necklace
		e.other:SummonItem(1779); -- A Note
		e.other:Ding();
		e.other:Faction(11,20,0);
		e.other:Faction(184,20,0);
		e.other:Faction(235,-20,0);
		e.other:Faction(105,-20,0);
		e.other:AddEXP(1000);
	end
	item_lib.return_items(e.self, e.other, e.trade)
end

-- END of FILE Zone:freportw -- Glyssa_Sonshaw