local mpg_helper = {};

function mpg_helper.UpdateGroupTrialLockout(player_list_in, this_bit_in, lockout_name_in)
  local instance_requests = require("instance_requests");
  local entity_list = eq.get_entity_list();
  local client;
  local client_globals;

  for k,v in pairs(player_list_in) do
    -- Set a 72 hour lockout on a Win
    eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
    client = entity_list:GetClientByCharID(v) 
    client_globals = eq.get_qglobals(client);
  
    -- Get the bits of the MPG Trials completed; we should only award an AA the first time 
    -- a Character complets a trial.
    local mpg_group_trials = tonumber(client_globals["mpg_group_trials"]);
    if ( mpg_group_trials == nil ) then mpg_group_trials = 0; end
    
    local has_done_this_trial; 
    if (bit.band(mpg_group_trials, this_bit_in) == 0) then
      has_done_this_trial = false;
    else
      has_done_this_trial = true;
    end

    -- Has character done this trial before?
    if ( has_done_this_trial == false ) then

      local i = 32;
      local aas_to_grant = 0;
      local v = mpg_group_trials;

      while (i>0) do 
        if (v-i) >= 0 then 
          aas_to_grant = aas_to_grant+1;
          v = v-i;
        end 
        i = i/2;
      end

      aas_to_grant = aas_to_grant + 1

      eq.zone_emote(15, "i: " .. i);
      eq.zone_emote(15, "aas_to_grant: " .. aas_to_grant);
      eq.zone_emote(15, "v: " .. v);
      eq.target_global("mpg_group_trials", tostring(bit.bor(mpg_group_trials, this_bit_in)), "F", 0, v, 0);
      client:GrantAlternateAdvancementAbility(466, aas_to_grant);

      client:Message(15, "The understanding you have gained by completing one of Mata Muram's trials has increased your maximum resistances.");
    else 
      client:Message(15, "You have again defeated the Master of Igenuity. Congratulations.");
    end
  end
end

return mpg_helper;
