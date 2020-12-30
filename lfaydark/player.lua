local expeditions = { mmcc = true, mmcf = true }
local mmcc_mmcf_door_id = 10 -- ldon raid entrance door

function event_click_door(e)
	local door_id = e.door:GetDoorID()
	if door_id == mmcc_mmcf_door_id then
		local dz = e.self:GetExpedition()
		if dz.valid and expeditions[dz:GetZoneName()] then
			e.self:MovePCDynamicZone(dz:GetZoneID())
		end
	end
end

function event_loot(e)
	if(e.self:Class() == "Cleric" and e.item:GetID() == 9585 ) then
		local qglobals = eq.get_qglobals(e.self);
		if(qglobals["cleric_epic"] >= "4" and qglobals["cleric_epic_lfay"] == nil ) then
			eq.spawn2(283157,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- #a chest (Epic 1.5)
			eq.set_global("cleric_epic_lfay","1",5,"F");
		end
	end
end