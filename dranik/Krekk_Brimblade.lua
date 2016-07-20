--dranik/Krekk_Brimblade.lua NPCID 336091
--Warrior Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("hail") and qglobals["warrior_epic"] == "15") then
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:AddToHateList(e.other,1);
	end
	eq.set_global("warrior_epic","14",5,"F");
end

function event_combat(e)
	if(e.joined) then
		e.self:Say("You are too weak for me! Die now by my hand!");
	else
		e.self:SetSpecialAbility(19, 1);
		e.self:SetSpecialAbility(20, 1);
		e.self:SetSpecialAbility(24, 1);
		e.self:SetSpecialAbility(35, 1);
	end
end

function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["warrior_epic"] == "14" and item_lib.check_turn_in(e.trade, {item1 = 60320, item2 = 60306, item3 = 60303})) then --Blackfall Blade, Potion of Blackfall Spirit and Hilt of Eternal Power
		e.self:Say("You've been working very closely with my brother, I see. No doubt he wants my help to finish da sword for you. I'll put da sword together, you can rest assured of that. But I won't be giving it back to you. Oh no, I think I'll keep it for myself. I'll be da one to continue da Brimblade legacy and strike fear into da hearts of men! Not him!");
		--eq.set_global("warrior_epic","15",5,"F");
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:AddToHateList(e.other,1);
		--eq.spawn2( ,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --2nd version of Krekk Brimblade 
		--eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end