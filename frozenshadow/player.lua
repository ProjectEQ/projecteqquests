function event_click_door(e)
    local cur_x = e.self:GetX();
    local cur_y = e.self:GetY();
    local cur_z = e.self:GetZ();
    local dest_x = 0;
    local dest_y = 0;
    local dest_z = 0;

    local door_id = e.door:GetDoorID();

    -- so we only need to port our other group members. Normal server door handling will handle the client clicking
    -- first we check if we're dealing with a raid group or not
    local raid = e.self:GetRaid();
    local player_list = nil;
    local player_list_count = nil;
    local raid_group = nil;
    -- not in a raid group we don't do shit either
    if (raid.valid and raid:GetGroup(e.self) ~= -1) then
        player_list = raid;
        player_list_count = raid:RaidCount();
        raid_group = raid:GetGroup(e.self);
    else
        -- don't need to do any extra fancy group checks
        local group = e.self:GetGroup();
        if (group.valid) then
            player_list = group;
            player_list_count = group:GroupCount();
        end
    end

    -- if the player_list is not nil, we have people to move!
    if (player_list ~= nil) then
        if (door_id == 2 or door_id == 166) then -- First Floor Door
            if (e.self:KeyRingCheck(20033) or e.self:HasItem(20033)) then
                dest_x = 660;
                dest_y = 100;
                dest_z = 40;
            end
        elseif (door_id == 4 or door_id == 167) then -- Second Floor Door
            if (e.self:KeyRingCheck(20034) or e.self:HasItem(20034)) then
                dest_x = 670;
                dest_y = 750;
                dest_z = 75;
            end
        elseif (door_id == 16 or door_id == 165) then -- Third Floor Door
            if (e.self:KeyRingCheck(20035) or e.self:HasItem(20035)) then
                dest_x = 170;
                dest_y = 755;
                dest_z = 175;
            end
        elseif (door_id == 27 or door_id == 169) then -- Fourth Floor Door
            if (e.self:KeyRingCheck(20036) or e.self:HasItem(20036)) then
                dest_x = -150;
                dest_y = 160;
                dest_z = 217;
            end
        elseif (door_id == 34 or door_id == 168) then -- Fifth Floor Door
            if (e.self:KeyRingCheck(20037) or e.self:HasItem(20037)) then
                dest_x = -320;
                dest_y = 725;
                dest_z = 12;
            end
        elseif (door_id == 1) then -- Sixth Floor Door
            if (e.self:KeyRingCheck(20038) or e.self:HasItem(20038)) then
                dest_x = 20;
                dest_y = 250;
                dest_z = 355;
            end
        end

        -- okay, we have destination now, maybe. If we do, we need to port our group members (but not us)
        if (dest_x ~= 0) then
            for i = 0, player_list_count - 1, 1 do
			    local mob_v = player_list:GetMember(i);
                if (mob_v.valid and mob_v:IsClient()) then
                    -- group:GetMember returns mob, so we need to cast it (this may be a group or raid)
                    local pc = mob_v:CastToClient();
                    if (pc.valid) then
                        -- don't move the initiator of this event
                        if (pc:CharacterID() ~= e.self:CharacterID()) then
                            -- if we're in a normal group (raid_group == nil) we don't need to verify the Group Number
                            if (raid_group == nil or player_list:GetGroupNumber(i) == raid_group) then
                                if (pc:CalculateDistance(cur_x, cur_y, cur_z) <= 40) then
                                    pc:MovePC(111, dest_x, dest_y, dest_z, 0); -- Zone: frozenshadow
                                end
                            end
                        end
                    end
				end
            end
        end
    end
end

