local mpg_helper = {};

-- Function: UpdateGroupTrialLockout
--
-- Description: 
--  Extracted code such that it can be reused in all 6 of the group MPG trials.
--
-- Example Usage:
--  local this_bit = 1;
--  local lockout_name = "MPG_weaponry";
--  local mpg_helper = require("mpg_helper");
--  mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, lockout_name);
function mpg_helper.UpdateGroupTrialLockout(player_list_in, this_bit_in, lockout_name_in)
  local instance_requests = require("instance_requests");
  local entity_list = eq.get_entity_list();
  local client;
  local client_globals;

  for k,v in pairs(player_list_in) do
    client = entity_list:GetClientByCharID(v) 
    if ( client.valid ) then 
      -- Set a 72 hour lockout on a Win (And in the Zone)
      eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
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

        local trial_bit_list = {1,2,4,8,16,32};
        local aas_to_grant = 0;
        for bitkey,bitval in pairs(trial_bit_list) do
          if (bit.band(mpg_group_trials,bitval) == 0 ) then
          else
            aas_to_grant = aas_to_grant + 1;
          end
        end
        aas_to_grant = aas_to_grant + 1;

        eq.target_global("mpg_group_trials", tostring(bit.bor(mpg_group_trials, this_bit_in)), "F", 0, v, 0);
        client:GrantAlternateAdvancementAbility(466, aas_to_grant);

        client:Message(15, "The understanding you have gained by completing one of Mata Muram's trials has increased your maximum resistances.");
      else 
        client:Message(15, "You have again mastered this trial.  Congratulations.");
      end
    else
      -- Client wasn't in the zone - but the Trial was Won so set the same lockout as if they were in the zone
      -- Since they weren't in the zone we can't award the AA; maybe we can add an NPC to hail similar
      -- to inktuta someday so won trials can get the reward if thats "live like" or if I just decide too.
      eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
    end
  end
end

function mpg_helper.UpdateRaidTrialLockout(player_list_in, this_bit_in, lockout_name_in)
  local instance_requests = require("instance_requests");

  for k,v in pairs(player_list_in) do
    -- Set a lockout 
    eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(122)), "H122", 0, v, 0);
  end
end

return mpg_helper;
