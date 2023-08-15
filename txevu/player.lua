local tacvi = "Tacvi, Seat of the Slaver"
local tacvi_raid = {
	expedition = { name="Tacvi, Seat of the Slaver", min_players=18, max_players=54 },
	instance   = { zone="tacvi", version=0, duration=eq.seconds("6h") },
	compass    = { zone="txevu", x=1575.46, y=1745.46, z=-397.62 },
	safereturn = { zone="txevu", x=-325, y=0, z=-422.12, h=128 },
	zonein     = { x=4, y=9, z=-6.87, h=376 }
}

function event_click_door(e)
	local is_gm = e.self:GetGM();
	local door_id = e.door:GetDoorID();
	local entity_list = eq.get_entity_list();

	if door_id == 55 then -- Bloodfeaster
		if eq.get_entity_list():IsMobSpawnedByNpcTypeID(297082) then
			eq.signal(297082,1); --signal Bloodfeaster to initiate sequence
		end
	elseif door_id == 23 then -- Zun Statue
		if e.self:GetInventory():HasItem(64034, 1, 32) == Slot.Cursor then 
			if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(297150) then 
				if not is_gm and e.self:GetRaidMemberCountInZone() < 18 then
					e.self:Message(MT.NPCQuestSay, "You don't have enough comrades with you to venture into this dangerous area. Come back when you have at least eighteen friends to join you on this perilous journey.")
				elseif not is_gm and e.self:DoesAnyPartyMemberHaveLockout(tacvi, "Replay Timer", 54) then
					e.self:Message(MT.NPCQuestSay, "Someone in your party has been on this expedition too recently and cannot yet go again.'")
				else
					local dz = e.self:CreateExpedition(tacvi_raid)
				end
			end
		else
			local dz = e.self:GetExpedition()
			if dz.valid then
				e.self:MovePCDynamicZone("tacvi") 
			else
				e.self:Message(MT.Red,"The gateway to the seat of the slaver is sealed off to you. Perhaps you would be able to enter if you needed to adventure there.");
			end
		end
	elseif door_id == 25 then -- Zone in Statue
		local dz = e.self:GetExpedition()
		if dz.valid then
			e.self:MovePCDynamicZone("tacvi") 
		else
			e.self:Message(MT.Red,"The gateway to the seat of the slaver is sealed off to you. Perhaps you would be able to enter if you needed to adventure there.");
		end
	elseif door_id == 10 or door_id == 21 then -- Zun Door
		if door_id == 10 and e.self:HasItem(17288) then
			entity_list:FindDoor(21):ForceOpen(e.self);
		elseif door_id == 21 and e.self:HasItem(17288) then
			entity_list:FindDoor(10):ForceOpen(e.self);
		end
	end
end

function event_enter_zone(e)
	if e.self:GetBindZoneID() == 297 then    
		e.self:Message(MT.Default, "Illegal Bind!")
		e.self:MovePC(69,840,70,0,0)
	end
end
