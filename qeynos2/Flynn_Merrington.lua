function event_say(e)

	local tax = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say("Oh look.. another gnoll pup. This bar is too rough for the likes of you. Why don't you try Fish's. We don't need any more regulars here, chump!");
	elseif(e.message:findi("mira sayer's tax")and tax.tax_collection ~= nil) then
		e.self:Say("Ha! Yeah, I took their tax money. What are you going to do about it, little gnoll pup? Tell you want.. I will cut you a deal. You tell me you are a [gnoll loving weakling who isn't fit to comb my feet] and I will give you that merchant's tax money.");
	elseif(e.message:findi("gnoll loving weakling who isn't fit to comb my feet")and tax.tax_collection ~= nil) then
		e.self:Say(string.format("BWAH! HA HA HA! Did you all hear that?! %s is a gnoll loving weakling who isn't fit to comb my feet! BWAH HA HA! MY FEET! HA HA HA! Oh.. too rich.. Heh.. HA HA HA! Oh.. Heh heh heh",e.other:GetName()));
		e.other:SummonItem(13174);
		e.other:Faction(33,-10,0);
		eq.signal(2083,6);
		eq.signal(2063,5);
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13122})) then
		e.self:Say("Well, now... That's cutting out the middle man. Thanks, chum! Now, beat it!");
		e.other:Ding();
		e.other:Faction(33,-20,0);
		e.other:Faction(217,20,0);
		e.other:Faction(53,-20,0);
		e.other:Faction(135,20,0);
		e.other:Faction(164,-20,0);
		e.other:AddEXP(500);
		e.other:SummonItem(13123);
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end

function event_signal(e)

	e.self:Say("HA! You Erudites never could handle your liquor. Go feed the fish.");
	eq.signal(2040,1);
	
end
