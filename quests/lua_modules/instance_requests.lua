
function ValidateInstanceRequest(instance, max_players, requestor, event_globals)
  local player_list = nil;
  local player_list_count = nil;
  local raid = requestor:GetRaid();
  local request = { ["valid"] = false, ["flags"] = 0 }
  if (raid.valid or requestor:Admin() > 80) then
    local instance_id = eq.get_instance_id(instance,0);
    if (instance_id == nil or instance_id == 0) then
      player_list = raid;
      player_list_count = raid:RaidCount();
      if (player_list ~= nil) then
        if(raid:RaidCount() <= max_players) then
          local requestor_bits = GetClientLockoutBits(requestor, event_globals);
          request.flags = requestor_bits;
          for i = 0, player_list_count - 1, 1 do
            local client = player_list:GetMember(i):CastToClient();
            if (client.valid) then
              local client_bits = GetClientLockoutBits(client, event_globals);
              local compared_bits = bit.bxor(requestor_bits, bit.bor(requestor_bits, client_bits));
              if (requestor:Admin() <= 80 and compared_bits > 0) then
                local client_lockouts = GetLockedOutEvents(compared_bits, event_globals);
                requestor:Message(13, client:GetCleanName().." has an active lockout for: "..client_lockouts[1]);
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

function GetLockedOutEvents(locked_bits, event_globals) 
  local locked = {}
  for i, v in ipairs(event_globals) do
    if (bit.band(locked_bits, 2^(i-1)) == 1) then
      table.insert(locked, v[2])
    end
  end
  return locked;
end

function GetClientLockoutBits(client, event_globals)
  local qglobals = eq.get_qglobals(client);
  local client_bits = 0;
  for i, v in ipairs(event_globals) do
    if (qglobals[v[1]] ~= nil) then
      client_bits = bit.bor(client_bits, 2^(i-1));
    end
  end
  return client_bits;
end