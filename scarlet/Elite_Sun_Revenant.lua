--scarlet\Elite_Sun_Revenant.lua NPC ID 175306
--Wizard Epic 1.5
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(e.message:findi("gem") and qglobals["wiz_epic"] == "1") then
		e.self:SetSpecialAbility(19, 0);
		e.self:SetSpecialAbility(20, 0);
		e.self:SetSpecialAbility(24, 0);
		e.self:SetSpecialAbility(35, 0);
		e.self:AddToHateList(e.other,1);
	end
end

function event_combat(e)
	if(e.joined) then
		eq.zone_emote(15, "A voice booms from the center of the cauldron. 'These gems are sacred, important to our survival, you shall not have them.'");
	else
		e.self:SetSpecialAbility(19, 1);
		e.self:SetSpecialAbility(20, 1);
		e.self:SetSpecialAbility(24, 1);
		e.self:SetSpecialAbility(35, 1);
	end
end