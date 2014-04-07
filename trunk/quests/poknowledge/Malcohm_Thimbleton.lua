-- poknowledge\Malcohm_Thimbleton.lua NPCID 202341 
 
function event_say(e)
		if(e.message:findi("hail")) then
			e.self:Emote("reeks of elven wine and dwarven ale as you approach him.  He's having a hard time putting a sentence together.  'Salut... sassaf...swee...erm...hello Innsolent! *hic* I'm sure you're here to...to...What was I saying? *hic* oh yes! You're here to turn your silly robe into a proper tunic! And I'm just the gnome to do it! Now where'd I put my needle and thread. *hic*  Give me that silly robe and I'll make a proper piece of clothing out of it.'");
		end
end

function event_trade(e)
	local item_lib = require("items");
	local tunic = 0;

	if(item_lib.check_turn_in(e.trade, {item1 = 26528})) then -- Bile Stained Robes
		e.other:SummonItem(77503); -- Bile Stained Jerkin
		tunic =1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 6073})) then -- Cured Shade Silk Robe
		e.other:SummonItem(77501); -- Cured Shade Silk Tunic
		tunic =1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 29084})) then -- Guardian Robe
		e.other:SummonItem(77504); -- Guardian Jerkin
		tunic =1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 10845})) then -- Robe of the Azure Sky
		e.other:SummonItem(77502); -- Tunic of the Azure Sky
		tunic =1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 2798})) then -- Shade Silk Robe
		e.other:SummonItem(77500); -- Shade Silk Tunic
		tunic =1;
	elseif(item_lib.check_turn_in(e.trade, {item1 = 30858})) then -- Shainai's Nightie
		e.other:SummonItem(77505); -- Shainai's Tunic
		tunic =1;
	end
	
	if(tunic == 1) then
		e.self:Emote("takes the tunic from you and peers at it. 'What'd you give me this for "..e.other:GetName().."? It's clearly not my size! Oh! you wanted it modified that's right.' He turns and puts the robe on his work bench and slowly but surely goes to work on it. Half way through he spills some of his wine on it. Undaunted, he continues to work until he finally turns back to you and hands you a very well made tunic. Although it does smell of elven wine now.");
		e.other:Ding();
	end
	item_lib.return_items(e.self, e.other, e.trade);
end