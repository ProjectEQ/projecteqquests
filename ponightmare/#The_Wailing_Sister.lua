function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail")) then
		if ( qglobals["shadowknight_epic"] == "4") then
			e.self:Emote("cackles as she assaults you.");
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetSpecialAbility(35, 0);
			e.self:AddToHateList(e.other,1);
		else 
			e.self:Emote("moans sadly but doesn''t seem to notice you.");
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end