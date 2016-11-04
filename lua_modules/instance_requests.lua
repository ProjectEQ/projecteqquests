local InstanceRequests = {}

function InstanceRequests.ValidateGroupRequest(instance, version, min_players, max_players, min_level, requestor, event_globals)
  local invalidRequest = { ["valid"] = false, ["flags"] = 0 };

  local player_list = nil;
  player_list = requestor:GetGroup();
  if (!player_list.valid) then
    requestor:Message(13, "You are not in a valid group.");
    return invalidRequest;
  end

  local instance_id = eq.get_instance_id(instance, version);
  if (instance_id ~= nil or instance_id ~= 0) then
    requestor:Message(13, "You are already in an instance.");
    return invalidRequest;
  end

  local player_list_count = player_list:GroupCount();
  if ( player_list_count < min_players or player_list_count > max_players) then
    requestor:Message(13, "You do not meet the player count requirement.  You have " .. player_list_count .. " players.  You must have at least " .. min_players .. " and no more than " .. max_players .. ". ");
    return invalidRequest;
  end

  local requestor_bits = InstanceRequests.GetClientLockoutBits(requestor, event_globals);

  for i = 0, player_list_count - 1, 1 do
    local groupMember = player_list:GetMember(i):CastToClient();
    if (!groupMember.valid) then
      requestor:Message(13, "All members of the group need to be in " .. eq.get_zone_long_name() .. ". " );
      return invalidRequest;
    end
    local groupMember_bits = InstanceRequests.GetClientLockoutBits(groupMember, event_globals);
    local compared_bits = bit.bxor(requestor_bits, bit.bor(requestor_bits, groupMember_bits));
    --conflicting lockouts, but not a GM over level 80 with GM status turned on
    if (compared_bits > 0 and (requestor:Admin() <= 80  or (requestor:Admin() > 80 and requestor:GetGM() == false))) then
      requestor:Message(13, groupMember:GetCleanName().." has the following lockouts:");
      InstanceRequests.DisplayLockouts(requestor, groupMember, event_globals);
      return invalidRequest;
    end
  end

  return { ["valid"] = true, ["flags"] = requestor_bits };
end

function InstanceRequests.ValidateRaidRequest(instance, version,  min_players, max_players, min_level, item_requirements, requestor, event_globals)
  -- You do not meet the player count requirement.  You have 1 players.  You must have at least 6 and no more than 54.
  local raid = requestor:GetRaid();
  local invalidRequest = { ["valid"] = false, ["flags"] = 0 };

  if (!raid.valid) then
    requestor:Message(13, "You are not in a valid raid.");
    return invalidRequest;
  end

  local instance_id = eq.get_instance_id(instance, version);
  if (instance_id ~= nil or instance_id ~= 0) then
    requestor:Message(13, "You are already in an instance.");
    return invalidRequest;
  end

  local raidCount = raid:RaidCount();
  if (raidCount < min_players or raidCount > max_players) then
    requestor:Message(13, "You do not meet the player count requirement.  You have " .. raidCount .. " players.  You must have at least " .. min_players .. " and no more than " .. max_players .. ". ");
    return invalidRequest;
  end

  if (raid:GetLowestLevel() < min_level) then
    requestor:Message(13, "All members must be over level " .. min_level .. ".");
    return invalidRequest;
  end

  local requestor_bits = InstanceRequests.GetClientLockoutBits(requestor, event_globals);
  for i = 0, raidCount - 1, 1 do
    local raidMember = raid:GetMember(i):CastToClient();
    if (!raidMember.valid) then
      requestor:Message(13, "All members of the raid need to be in " .. eq.get_zone_long_name() .. ". " );
      return invalidRequest;
    end
    if (item_requirements ~= nil) then
      local member_has_valid_items = InstanceRequests.ValidateItemRequirements(raidMember, item_requirements);
      if (member_has_valid_items == false) then
        requestor:Message(13, raidMember:GetCleanName() .. " is missing a required item.");
        return invalidRequest; 
      end
    end
    local raidMember_bits = InstanceRequests.GetClientLockoutBits(raidMember, event_globals);
    local compared_bits = bit.bxor(requestor_bits, bit.bor(requestor_bits, raidMember_bits));
    --conflicting lockouts, but not a GM over level 80 with GM status turned on
    if (compared_bits > 0 and (requestor:Admin() <= 80  or (requestor:Admin() > 80 and requestor:GetGM() == false))) then
      requestor:Message(13, raidMember:GetCleanName().." has the following lockouts:");
      InstanceRequests.DisplayLockouts(requestor, raidMember, event_globals);
      return invalidRequest;
    end
  end

  return { ["valid"] = true, ["flags"] = requestor_bits };
end

function InstanceRequests.ValidateItemRequirements(client, item_requirements)
  if (item_requirements.require_any ~= nil) then
    for i, id in ipairs(item_requirements.require_any) do
      if (client:HasItem(id) == true) then
        return true;
      end
    end
    return false;
  else
    local required_ids = item_requirements.require_all or item_requirements;
    for i, id in ipairs(required_ids) do
      if (client:HasItem(id) == false) then
        return false;
      end
    end
    return true;
  end
end

function InstanceRequests.ValidateInstanceRequest(instance, max_players, requestor, event_globals)
  local player_list = nil;
  local player_list_count = nil;
  local raid = requestor:GetRaid();
  local request = { ["valid"] = false, ["flags"] = 0 }
  if (raid.valid) then
    local instance_id = eq.get_instance_id(instance,0);
    if (instance_id == nil or instance_id == 0) then
      player_list = raid;
      player_list_count = raid:RaidCount();
      if (player_list ~= nil) then
        if(raid:RaidCount() <= max_players) then
          local requestor_bits = InstanceRequests.GetClientLockoutBits(requestor, event_globals);
          request.flags = requestor_bits;
          for i = 0, player_list_count - 1, 1 do
            local client = player_list:GetMember(i):CastToClient();
            if (client.valid) then
              local client_bits = InstanceRequests.GetClientLockoutBits(client, event_globals);
              local compared_bits = bit.bxor(requestor_bits, bit.bor(requestor_bits, client_bits));
              if (compared_bits > 0 and (requestor:Admin() <= 80  or (requestor:Admin() > 80 and requestor:GetGM() == false))) then
                local client_lockouts = InstanceRequests.GetLockedOutEvents(compared_bits, event_globals);
                requestor:Message(13, client:GetCleanName().." has the following lockouts:");
                InstanceRequests.DisplayLockouts(requestor, client, event_globals);
                return request;
              end
            end
          end
          request.valid = true;
        else
          requestor:Message(13, "You have "..player_list_count.." players in raid.  A maximum of "..max_players.." is allowed.");
        end
      end
    else
      requestor:Message(13, "You are already in an instance.");
    end
  else
    requestor:Message(13, "You are not in a raid.");
  end
  return request;
end

function InstanceRequests.GetLockedOutEvents(locked_bits, event_globals)
  local locked = {}
  for i, v in ipairs(event_globals) do
    if (bit.band(locked_bits, 2^(i-1)) == 1) then
      table.insert(locked, v[2])
    end
  end
  return locked;
end

function InstanceRequests.GetClientLockoutBits(client, event_globals)
  local qglobals = eq.get_qglobals(client);
  local client_bits = 0;
  for i, v in ipairs(event_globals) do
    if (qglobals[v[1]] ~= nil) then
      client_bits = bit.bor(client_bits, 2^(i-1));
    end
  end
  return client_bits;
end

function InstanceRequests.GetLockoutEndTimeForHours(hours)
  return os.time() + (hours * 3600)
end

function InstanceRequests.DisplayLockouts(requestor, client, event_globals)
  local qglobals = eq.get_qglobals(client);
  local hasLockouts = false;
  for i, v in ipairs(event_globals) do
    if (tonumber(qglobals[v[1]]) ~= nil) then
      local diff =  tonumber(qglobals[v[1]]) - os.time();
      local timeString = "";
      if (diff > 0) then
        local minutes = math.floor(diff / 60);
        local hours = 0;
        local days = 0;
        if (minutes >= 60) then
          hours = math.floor(minutes / 60);
          minutes = math.mod(minutes,60);
          if (hours >= 24) then
            days = math.floor(hours / 24);
            hours = math.mod(hours,24);
          end
        end
        if (days>0) then timeString = timeString..days.."D " end
        if (hours>0) then timeString = timeString..hours.."H " end
        if (minutes>0) then timeString = timeString..minutes.."M" end
        requestor:Message(13,v[2].." - Remaining Lockout: "..timeString);
        hasLockouts = true;
      end
    end
  end
  if (requestor == client and hasLockouts == false) then
    requestor:Message(13, "You currently have no instance lockouts.");
  end
end

return InstanceRequests;
