function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say(string.format("Greetings, %s! Nesiff Tallaherd, owner and operator of Nesiff's Wooden Weapons, at your service. I am the finest woodworker in all of Qeynos. Even the Qeynos Guard uses my arrows, thanks to [Guard Weleth].",e.other:GetName()));
	elseif(e.message:findi("guard weleth")) then
		e.self:Say("Guard Weleth is like a son to me. He is responsible for purchasing supplies for the Qeynos Guard. He buys arrows from me. He is usually stationed near the North Gate.");
	elseif(e.message:findi("tax collection") and tax.tax_collection ~= nil) then
		e.self:Say("Tax time again already?? It seems like I just paid yesterday.. High taxes and low sales mean I won't be able to stay in business much longer. Good thing ol' Weleth is taking care of me. Here are my taxes.");
		e.other:Faction(217,-10,0);
		e.other:SummonItem(13173);
	end
	
end

function event_trade(e)

	local item_lib =require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13925})) then -- Crate of Defective Arrows
		e.self:Say("Oh dear. I hope my mistake will not bring too much grief down on poor Weleth. He was told not to order arrows from me after the last time I fouled up their shipment. But Weleth knew I needed the account to stay in business. Could you please rush this new invoice to him right away? Thank you.");
		e.other:SummonItem(18824); -- Slip of Parchment
		e.other:Ding();
		e.other:Faction(217,10,0); -- Merchants of Qeynos
		e.other:Faction(33,-20,0); -- Circle Of Unseen Hands
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:Faction(47,10,0); -- Coalition of Tradefolk
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:AddEXP(8000);
	elseif(item_lib.check_turn_in(e.trade, {item1 = 18012})) then
		e.self:Say("Oh dear. I hope my mistake will not bring too much grief down on poor Weleth. He was told not to order arrows from me after the last time I fouled up their shipment. But Weleth knew I needed the account to stay in business. Could you please rush this new invoice to him right away? Thank you.");
		e.other:SummonItem(13864);
		e.other:Ding();
		e.other:Faction(217,10,0); -- Merchants of Qeynos
		e.other:Faction(33,-20,0); -- Circle Of Unseen Hands
		e.other:Faction(9,10,0); -- Antonius Bayle
		e.other:Faction(47,10,0); -- Coalition of Tradefolk
		e.other:Faction(135,10,0); -- Guards of Qeynos
		e.other:AddEXP(250);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
end
