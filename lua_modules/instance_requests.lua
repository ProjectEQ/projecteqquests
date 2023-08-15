local InstanceRequests = {}

function InstanceRequests.ValidateRequest(groupOrRaid, instance, version,  min_players, max_players, min_level, item_requirements, global_requirements, requestor, event_globals)
  local invalidRequest = { ["valid"] = false, ["flags"] = 0 };

  local player_list = nil;
  local player_list_count = 0;
  if (groupOrRaid == 'raid') then
    player_list = requestor:GetRaid();
    player_list_count = player_list:RaidCount();
  else 
    if (groupOrRaid == 'group') then
      player_list = requestor:GetGroup();
      player_list_count = player_list:GroupCount();
    end
  end

  local instance_id = eq.get_instance_id(instance, version);
  local basicRequirementsAreValid =
    InstanceRequests.BasicRequirementsAreValid(requestor, instance_id, min_players, max_players, min_level, player_list, player_list_count);
  if not basicRequirementsAreValid then
    return invalidRequest;
  end

  -- Check each client for the required globals
  if (global_requirements ~= nil) then
    local reqs = InstanceRequests.PlayersHaveQuestGlobals(requestor, player_list, player_list_count, global_requirements);
    if not reqs then
      return invalidRequest;
    end
  end

  local requestor_bits = InstanceRequests.GetClientLockoutBits(requestor, event_globals);
  for i = 0, player_list_count - 1, 1 do
    local member = player_list:GetMember(i);
    if not member.valid then
      requestor:Message(MT.Red, "All members of the group/raid need to be in " .. eq.get_zone_long_name() .. ". " );
      return invalidRequest;
    end
    if (member:IsClient()) then
      local member_v = member:CastToClient();
      if (item_requirements ~= nil) then
        local member_has_valid_items = InstanceRequests.ValidateItemRequirements(member_v, item_requirements);
        if not member_has_valid_items then
          requestor:Message(MT.Red, member_v:GetCleanName() .. " is missing a required item.");
          return invalidRequest; 
        end
      end
      local member_bits = InstanceRequests.GetClientLockoutBits(member_v, event_globals);
      local compared_bits = bit.bxor(requestor_bits, bit.bor(requestor_bits, member_bits));
      --conflicting lockouts, but not a GM over level 80 with GM status turned on
      if (compared_bits > 0 and (requestor:Admin() <= 80  or (requestor:Admin() > 80 and not requestor:GetGM() ))) then
        requestor:Message(MT.Red, member_v:GetCleanName().." has the following lockouts:");
        InstanceRequests.DisplayLockouts(requestor, member_v, event_globals);
        return invalidRequest;
      end
    end
  end

  return { ["valid"] = true, ["flags"] = requestor_bits };
end

function InstanceRequests.ValidateRequestOLD(groupOrRaid, instance, version,  min_players, max_players, min_level, item_requirements, requestor, event_globals)
  local invalidRequest = { ["valid"] = false, ["flags"] = 0 };

  local player_list = nil;
  local player_list_count = 0;
  if (groupOrRaid == 'raid') then
    player_list = requestor:GetRaid();
    player_list_count = player_list:RaidCount();
  else 
    if (groupOrRaid == 'group') then
      player_list = requestor:GetGroup();
      player_list_count = player_list:GroupCount();
    end
  end

  local instance_id = eq.get_instance_id(instance, version);
  local basicRequirementsAreValid =
    InstanceRequests.BasicRequirementsAreValid(requestor, instance_id, min_players, max_players, min_level, player_list, player_list_count);
  if not basicRequirementsAreValid then
    return invalidRequest;
  end

  local requestor_bits = InstanceRequests.GetClientLockoutBits(requestor, event_globals);
  for i = 0, player_list_count - 1, 1 do
    local member = player_list:GetMember(i);
    if not member.valid then
      requestor:Message(MT.Red, "All members of the group/raid need to be in " .. eq.get_zone_long_name() .. ". " );
      return invalidRequest;
    end
    if (member:IsClient()) then
      local member_v = member:CastToClient();
      if (item_requirements ~= nil) then
        local member_has_valid_items = InstanceRequests.ValidateItemRequirements(member_v, item_requirements);
        if not member_has_valid_items then
          requestor:Message(MT.Red, member_v:GetCleanName() .. " is missing a required item.");
          return invalidRequest; 
        end
      end
      local member_bits = InstanceRequests.GetClientLockoutBits(member_v, event_globals);
      local compared_bits = bit.bxor(requestor_bits, bit.bor(requestor_bits, member_bits));
      --conflicting lockouts, but not a GM over level 80 with GM status turned on
      if (compared_bits > 0 and (requestor:Admin() <= 80  or (requestor:Admin() > 80 and not requestor:GetGM()))) then
        requestor:Message(MT.Red, member_v:GetCleanName().." has the following lockouts:");
        InstanceRequests.DisplayLockouts(requestor, member_v, event_globals);
        return invalidRequest;
      end
    end
  end

  return { ["valid"] = true, ["flags"] = requestor_bits };
end

function InstanceRequests.BasicRequirementsAreValid(requestor, instance_id, min_players, max_players, min_level, player_list, player_list_count)
  if not player_list.valid then
    requestor:Message(MT.Red, "You are not in a valid group/raid.");
    return false;
  end

  if (instance_id ~= nil and instance_id ~= 0) then
    requestor:Message(MT.Red, "You are already in an instance.");
    return false;
  end

  if (player_list_count < min_players or player_list_count > max_players) then
    requestor:Message(MT.Red, "You do not meet the player count requirement.  You have " .. player_list_count .. " players.  You must have at least " .. min_players .. " and no more than " .. max_players .. ". ");
    return false;
  end

  if (player_list:GetLowestLevel() < min_level) then
    requestor:Message(MT.Red, "All members must be over level " .. min_level .. ".");
    return false;
  end

  return true;
end

function InstanceRequests.ValidateItemRequirements(client, item_requirements)
  if (item_requirements.require_any ~= nil) then
    for i, id in ipairs(item_requirements.require_any) do
      if client:HasItem(id) then
        return true;
      end
    end
    return false;
  else
    local required_ids = item_requirements.require_all or item_requirements;
    for i, id in ipairs(required_ids) do
      if not client:HasItem(id) then
        return false;
      end
    end
    return true;
  end
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
        requestor:Message(MT.Red,v[2].." - Remaining Lockout: "..timeString);
        hasLockouts = true;
      end
    end
  end
  if requestor == client and not hasLockouts then
    requestor:Message(MT.Red, "You currently have no instance lockouts.");
  end
end

function InstanceRequests.PlayersHaveQuestGlobals(requestor, player_list, player_list_count, required_globals)
  local retval = true;
  for i = 0, player_list_count -1, 1 do
    local member = player_list:GetMember(i);
    if (member.valid and member:IsClient()) then
      local member_v = member:CastToClient();
      local member_check = InstanceRequests.PlayerHasQuestGlobals(requestor, member_v, required_globals);
      if not member_check then
        retval = false;
      end
    end
  end
  return retval;
end

function InstanceRequests.PlayerHasQuestGlobals(requestor, member, required_globals)
  local member_globals = eq.get_qglobals(member);
  local retval = true;
  for k,v in pairs(required_globals) do
    if (member_globals[v[1]] == nil) then
      requestor:Message(MT.Red, member:GetName() .. " " .. v[2] );
      retval = false;
    end
  end
  return retval;
end

-- Check all the members of the raid or group for a specific quest_global, if they they 
-- have that quest_global print out the associated description with the players name
-- so the requestor can punt them from the raid and try again.
-- If any of the players have the lockout then 'true' is returned
-- otherwise false is returned
function InstanceRequests.CheckPlayersForLockout(thing, global, globals_desc, requestor)
  local retval = false;
  local player_list = nil;
  local player_list_count = 0;
  if (thing == 'raid') then
    player_list = requestor:GetRaid();
    player_list_count = player_list:RaidCount();
  elseif (thing == 'group') then
    player_list = requestor:GetGroup();
    player_list_count = player_list:GroupCount();
  end

  for i = 0, player_list_count -1, 1 do
    local member = player_list:GetMember(i);
    if (member.valid and member:IsClient()) then
      local member_v = member:CastToClient();
      local member_globals = eq.get_qglobals(member_v);
      if (member_globals[global] ~= nil) then
        requestor:Message(MT.Red, member_v:GetName() .. ' has ' .. globals_desc);
        retval = true;
      end
    end
  end
  return retval;
end
return InstanceRequests;
