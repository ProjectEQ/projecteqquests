local InstanceRequests = {}

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
    if (qglobals[v[1]] ~= nil) then
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
end

return InstanceRequests;