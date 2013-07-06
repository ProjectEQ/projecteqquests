function event_trade(e)
local item_lib = require("items");
	if (item_lib.check_turn_in(e.trade, {item1 =  19661, item2 = 19612})) then
		e.self:Emote("fashions a grip out of the thorn drakeling scales then tests and polishes the blade of the machete.");
		e.self:Say("Yer another one of Megosh's trainees I suppose. This here's a fine weapon for a young Ranger of the Storm Reapers like yerself.");     
		e.other:Faction(218,5);
		e.other:Faction(77,5);
		e.other:Faction(133,5);
		e.other:Faction(208,5);
		e.other:Faction(369,-5);
		e.other:AddEXP(10);
		e.other:SummonItem(19687); 
	elseif(item_lib.check_turn_in(e.trade, {item1 = 19663, item2 = 19616})) then
		e.self:Emote("fashions a grip out of the large fruit bat wing then tests and polishes the blade of the scimitar.");
		e.self:Say("Yer another one of Hibbs trainees I suppose. This here's a fine weapon for a young Druid of the Storm Reapers like yourself.");
		e.other:Faction(218,5);
		e.other:Faction(77,5);
		e.other:Faction(133,5);
		e.other:Faction(208,5); 
		e.other:Faction(369,-5); 
		e.other:AddEXP(10); 
		e.other:SummonItem(19686);
	elseif (item_lib.check_turn_in(e.trade,  {item1 = 19662, item2 = 13060})) then
		e.self:Emote("fashions a grip out of the large snake skin then tests and polishes the blade of the sword.");
		e.self:Say("Yer another one of Kaya's trainees I suppose. This here's a fine weapon for a young Paladin like yerself.");     
		e.other:Faction(218,5);
		e.other:Faction(77,5);
		e.other:Faction(133,5);
		e.other:Faction(208,5);
		e.other:Faction(369,-5);
		e.other:AddEXP(10);
		e.other:SummonItem(19685); 
	else
		item_lib.return_items(e.self, e.other, e.trade);
	end
end


--Scripted By: Fatty Beerbelly and Krich11
