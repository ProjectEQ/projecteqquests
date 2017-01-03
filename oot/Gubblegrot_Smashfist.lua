--oot/Gubblegrot_Smashfist.lua NPCID 69140
--SK Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);	
	if(e.message:findi("hail")) then
		if ( qglobals["shadowknight_epic"] == "6") then
			e.self:Say("smasshh!");
			e.self:SetSpecialAbility(19, 0);
			e.self:SetSpecialAbility(20, 0);
			e.self:SetSpecialAbility(24, 0);
			e.self:SetSpecialAbility(25, 0);
			e.self:SetSpecialAbility(35, 0);
			e.self:SetLevel(66);
			e.self:AddToHateList(e.other,1); 
		end
	end
end

function event_trade(e)
	local item_lib = require("items");
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end
	
	