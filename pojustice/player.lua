local player_list = nil;
local player_list_count = nil;
local raid_group = nil;
local clicker = nil;

function event_click_door(e)
	local seventh_hammer_doors = { 1, 2, 3, 4, 5, 6 };
	local door_id = e.door:GetDoorID();

	if (door_id >= 8 and door_id <= 13) then
		e.self:MovePC(201, 456, 825, 9, 360); -- Zone: pojustice
	elseif (door_id >= 1 and door_id <= 6) then
		if (e.self:GetItemIDAt(Slot.Cursor) == 31599) then
			-- make sure these are reset
			player_list = nil;
			player_list_count = nil;
			raid_group = nil;
			clicker = e.self;
			-- if we're in a raid, we need to move our raid group members
			local raid = e.self:GetRaid();
			if (raid.valid) then
				player_list = raid;
				player_list_count = raid:RaidCount();
				raid_group = raid:GetGroup(e.self);
			else
				-- so we're not in raid, lets check for real groups
				local group = e.self:GetGroup();
				if (group.valid) then
					player_list = group;
					player_list_count = group:GroupCount();
				end
			end
 			MoveGroup(e.self:GetX(), e.self:GetY(), e.self:GetZ(), 75, 65, 1308, 7, 121);
			--using this until proximity_say is fixed
			--monk has to have all trials done to loot Symbol on live so force monk to do the clickup or no triggered spawn
			local qglobals = eq.get_qglobals(e.self);
			local el = eq.get_entity_list();
			if (qglobals["monk_epic"] >= "5" and qglobals["monk_7thhammer"] == nil and el:IsMobSpawnedByNpcTypeID(201074) == false) then
				eq.unique_spawn(201074,0,0,71,1218,9,0); -- NPC: The_Seventh_Hammer
				eq.signal(201074, 999); -- NPC: The_Seventh_Hammer
				eq.set_global("monk_7thhammer","1",3,"H2");
			end
		else
 			e.self:MovePC(201, 156, 470, -48, 360); -- Zone: pojustice
		end
	end
end

function MoveGroup(src_x, src_y, src_z, distance, tgt_x, tgt_y, tgt_z, tgt_h)
	if (player_list ~= nil) then
		for i = 0, player_list_count - 1, 1 do
			local mob_v = player_list:GetMember(i);
			if (mob_v ~= nil and mob_v.valid and mob_v:IsClient()) then
				local client_v = mob_v:CastToClient();
				if (client_v.valid) then
					-- so we need to check if their group numbers match in raid need to check the clicker if they are in no group in a raid
					if (raid_group == nil or client_v:GetID() == clicker:GetID() or (raid_group ~= -1 and player_list:GetGroupNumber(i) == raid_group)) then
						-- check the distance and port them up if close enough
						if (client_v:CalculateDistance(src_x, src_y, src_z) <= distance) then
							-- port the player up
							client_v:MovePC(201, tgt_x, tgt_y, tgt_z, tgt_h); -- Zone: pojustice
						end
					end
				end
			end
		end
	end
end

