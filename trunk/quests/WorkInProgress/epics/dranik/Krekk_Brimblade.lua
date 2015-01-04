--dranik/Krekk_Brimblade.lua NPCID 336091
--Warrior Epic 1.5
function event_trade(e)
	local item_lib = require("items");
	local qglobals = eq.get_qglobals(e.other);
	if(item_lib.check_turn_in(e.trade, {item1 = 60320, item2 = 60305, item3 = 60303}) and qglobals["warrior_epic"] >= "14") then --Blackfall Blade, Potion of Blackfall Spirit and Hilt of Eternal Power
		e.self:Say("You've been working very closely with my brother, I see. No doubt he wants my help to finish da sword for you. I'll put da sword together, you can rest assured of that. But I won't be giving it back to you. Oh no, I think I'll keep it for myself. I'll be da one to continue da Brimblade legacy and strike fear into da hearts of men! Not him!");
		e.self:Say("You are too weak for me! Die now by my hand!");
		if(qglobals["warrior_epic"] < "15") then
			eq.set_global("warrior_epic","15",5,"F");
		end
		--eq.spawn2( ,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); --2nd version of Krekk Brimblade 
		eq.depop_with_timer();
	end
	item_lib.return_items(e.self, e.other, e.trade, e.text);
end