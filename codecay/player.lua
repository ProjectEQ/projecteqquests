-- player.lua codecay
function event_enter_zone(e)
	local qglobals = eq.get_qglobals(e.self);
	
	if(qglobals["mage_epic"] == "10" and qglobals["mage_epic_cod"] == nil) then
		e.self:Message(15,"Your staff begins to glow");
	end
end

function event_click_door(e)
	local qglobals = eq.get_qglobals(e.self)
	-- chair to click down to bertox event
	if (e.door:GetDoorID() == 7) then
		if(qglobals["pop_cod_preflag"] == "1" or e.self:GetGM()) then
			e.self:MovePC(200, 0, -16, -289, 256)
		else
			--made up
			e.self:Message(1, "There is still more work to be done.")
		end
	end
end

function event_loot(e)
	if(e.self:Class() == "Magician" and e.item:GetID() == 19544 and e.corpse:GetNPCTypeID()==200060) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["mage_epic"] == "10") then
			return 0;
		else
			return 1;
		end
	end
end		

