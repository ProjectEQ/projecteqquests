-- global script variables
local player_list = nil;
local player_list_count = nil;
local raid_group = nil;
local client_e = nil;
local entity_list = nil;

function event_click_door(e)
	-- populate the current entity list whenever someone clicks.
	entity_list = eq.get_entity_list();
	-- drop the door information into some local variables
	local door_id = e.door:GetDoorID();
	local open_type = entity_list:FindDoor(door_id):GetOpenType();
	client_e = e;
	-- make sure the player_list is clear
	player_list = nil;
	player_list_count = nil;
	raid_group = nil;
	-- only time we will use the raid value is if they are clicking on the Agnarr door
	-- otherwise, it is a group only port up.
	local raid = e.self:GetRaid();
	if (raid.valid) then
		player_list = raid;
		player_list_count = raid:RaidCount();
		raid_group = raid:GetGroup(e.self);
	else
		-- if group is not valid, it is a single player click up
		local group = e.self:GetGroup();
		if (group.valid) then
			player_list = group;
			player_list_count = group:GroupCount();
		end
	end

	-- Agnarr Tower aka electric penis
	if (door_id == 51) then
		-- check if the person clicking has the Symbol of Torden item id:9433 or has GM status of 80+ with the GM flag on.
		-- the point of checking both status and GM flag is so a dev with status > 80 can still pretend to be a non-GM.
		-- by using the status, we ensure someone cannot bypass the check by another GM using "#gm on" on a player.
		if (e.self:Admin() >= 80 and e.self:GetGM()) then
			PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 100, -765, -1735, 1270, 0, false);
		elseif (e.self:HasItem(9433)) then
			PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 100, -765, -1735, 1270, 0, false);
		else
			SendGargoyles(209024);
		end
	-- the four corner towers all use the same key and it can be on the keyring
	elseif (door_id == 61 or door_id == 63 or door_id == 65 or door_id == 67) then
		-- check if the Ring of Torden item id: 9425 is on the keyring
		local key_found = false;
		if (e.self:KeyRingCheck(9425)) then
			key_found = true;
		-- if it is not on the keyring check for them to have the item.
		elseif (e.self:HasItem(9425) == true) then
			key_found = true;
			-- add it tot he keyring
			e.self:KeyRingAdd(9425);
		-- allow a GM to click up
		elseif (e.self:Admin() >= 80 and e.self:GetGM()) then
			key_found = true;
		end
		-- Southeast tower
		if (door_id == 61) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 85, 145, 635, 128, true);
			else
				SendGargoyles(209110);
			end
		-- Southwest tower
		elseif (door_id == 63) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, -830, -865, 1375, 128, true);
			else
				SendGargoyles(209111);
			end
		-- Northwest tower
		elseif (door_id == 65) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, -350, -2200, 1955, 255, true);
			else
				SendGargoyles(209112);
			end
		-- Northeast tower
		elseif (door_id == 67) then
			-- did the player have the key?
			if (key_found) then
				PortIntoTower(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 50, 150, -1220, 1120, 128, true);
			else
				SendGargoyles(209113);
			end
		end
	end
end

function SendGargoyles(npcid_to_aggro)
	-- get all the npcs 
	local npc_list = entity_list:GetNPCList();
	if (npc_list ~= nil) then
		for npc in npc_list.entries do
			if (npc:GetNPCTypeID() == npcid_to_aggro) then
				-- set aggro on person who clicked
				npc:AddToHateList(client_e.self,1);
			end
		end
	end
end

function PortIntoTower(cur_x, cur_y, cur_z, distance, dest_x, dest_y, dest_z, dest_h, group_only)
	-- player_list contains e.self:GetGroup or e.self:GetRaid or is nil for a single player
	-- if it is not nil then port up the group/raid as long as they are in range
	if (player_list ~= nil) then
		-- iterate through the player_list (it is 0 based)
		for i = 0, player_list_count - 1, 1 do
			local mob_v = player_list:GetMember(i);
			if (mob_v.valid and mob_v:IsClient()) then
				-- MovePC and GetAggroCount are client functions and group:GetMember returns a mob (raid:GetMember returns client)
				local client_v = mob_v:CastToClient();
				-- make sure we actually have a valid client
				if (client_v.valid) then
					-- if raid_group is not nil, we're in a raid, so we need to verify group number if group_only is true
					-- yes yes, this is a bit gross
					if (raid_group == nil or (not group_only or (raid_group ~= -1 and player_list:GetGroupNumber(i) == raid_group) or client_v:GetID() == client_e.self:GetID())) then
						-- check the distance and port them up if close enough
						if (client_v:CalculateDistance(cur_x, cur_y, cur_z) <= distance) then
							-- port the player up
							client_v:MovePC(209, dest_x, dest_y, dest_z, dest_h); -- Zone: bothunder
						end
					end
				end
			end
		end
	else
		-- port the player up
		client_e.self:MovePC(209, dest_x, dest_y, dest_z, dest_h); -- Zone: bothunder
	end
end
