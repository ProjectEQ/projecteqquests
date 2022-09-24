-- items: 13174, 13122, 13123
function event_say(e)

	local qglobals = eq.get_qglobals(e.other);
	
	if(e.message:findi("hail")) then
		e.self:Say("Oh look.. another gnoll pup. This bar is too rough for the likes of you. Why don't you try Fish's. We don't need any more regulars here, chump!");
	elseif(e.message:findi("mira sayer's tax")and qglobals.tax_collection ~= nil) then
		e.self:Say("Ha! Yeah, I took their tax money. What are you going to do about it, little gnoll pup? Tell you want.. I will cut you a deal. You tell me you are a [gnoll loving weakling who isn't fit to comb my feet] and I will give you that merchant's tax money.");
	elseif(e.message:findi("gnoll loving weakling who isn't fit to comb my feet")and tax.tax_collection ~= nil) then
		e.self:Say(string.format("BWAH! HA HA HA! Did you all hear that?! %s is a gnoll loving weakling who isn't fit to comb my feet! BWAH HA HA! MY FEET! HA HA HA! Oh.. too rich.. Heh.. HA HA HA! Oh.. Heh heh heh",e.other:GetName()));
		e.other:SummonItem(13174); -- Item: Sayer's Tax Payment
		e.other:Faction(223,-10,0); -- Faction: Circle of Unseen Hands
		eq.signal(2083,6); -- NPC: Sabnie_Blagard General Supplies
		eq.signal(2063,5); -- NPC: Crow General Supplies
	end
	
end

function event_trade(e)

	local item_lib = require("items");
	
	if(item_lib.check_turn_in(e.trade, {item1 = 13122})) then
		e.self:Say("Well, now... That's cutting out the middle man. Thanks, chum! Now, beat it!");
		e.other:Ding();
		e.other:Faction(223,-20,0); -- Faction: Circle of Unseen Hands
		e.other:Faction(291,20,0); -- Faction: Merchants of Qeynos
		e.other:Faction(230,-20,0); -- Faction: Corrupt Qeynos Guards
		e.other:Faction(262,20,0); -- Faction: Guards of Qeynos
		e.other:Faction(273,-20,0); -- Faction: Kane Bayle
		e.other:AddEXP(500);
		e.other:SummonItem(13123); -- Item: Label of Erud's Tonic
	end
	
	item_lib.return_items(e.self, e.other, e.trade)
	
end

function event_signal(e)

	e.self:Say("HA! You Erudites never could handle your liquor. Go feed the fish.");
	eq.signal(2040,1); -- NPC: Moodoro_Finharn
	
end
