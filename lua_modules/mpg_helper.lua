-- Group Trial Version 1 of zone
-- Raid  Trial Version 2 of zone
--
-- MPG Group Trial Bits:
-- 1  MPG_fear
-- 2  MPG_ingenuity
-- 4  MPG_weaponry
-- 8  MPG_subversion
-- 16 MPG_efficiency
-- 32 MPG_destruciton
--
-- Lockout on Win: 72 hours
-- Lockout on Loss: 2 hours
--
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)
--
-- Lockout on Win: 5 days
-- Lockout on Loss: 2 hours (think the instance lives for 3 hours now so its really 3 hours)
-- items: 52413
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
      if lockout_name_in then
        eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
      end
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
    elseif lockout_name_in then
      -- Client wasn't in the zone - but the Trial was Won so set the same lockout as if they were in the zone
      -- Since they weren't in the zone we can't award the AA; maybe we can add an NPC to hail similar
      -- to inktuta someday so won trials can get the reward if thats "live like" or if I just decide too.
      eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
    end
  end
end

-- lockout time is in hours
function mpg_helper.SetLockoutTime(instance_id_in, lockout_name_in, lockout_time_in)
  local instance_requests = require("instance_requests");
  local player_list = eq.get_characters_in_instance(instance_id_in);
  for k,v in pairs(player_list) do
    eq.debug( "k: " .. k .. " v: " .. v .. " lockout: " .. lockout_name_in );
    eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(lockout_time_in)), "H" .. lockout_time_in, 0, v, 0);
  end
end

function mpg_helper.UpdateRaidTrialLockout(player_list_in, this_bit_in, lockout_name_in)
  local instance_requests = require("instance_requests");
  local el = eq.get_entity_list();
  local client;

  for k,v in pairs(player_list_in) do
    -- Set a lockout 
    if lockout_name_in then
      eq.target_global(lockout_name_in, tostring(instance_requests.GetLockoutEndTimeForHours(122)), "H122", 0, v, 0);
    end

    client = el:GetClientByCharID(v);
    if (client.valid) then 
      -- Client is in the zone update the raid bit 
      mpg_helper.RaidAnguishAccess(client, this_bit_in);
    else
      -- Client is not in the zone so set a 'temporary' global on the charcter which 
      -- will update the bit the next time the character zones into this trial.
      eq.target_global('mpg_raid_trial_won', tostring(this_bit_in), 'F', 0, v, 0);
    end
  end
end

function mpg_helper.RaidAnguishAccess(client, lockout_bit_in)
  -- 1  (Hate)       Mastery of Mind Rune 52407
  -- 2  (Endurance)  Mastery of Body Rune 52408
  -- 4  (Foresight)  Mastery of Tactics Rune 52409
  -- 8  (Spec)       Mastery of Arcana Rune 52410
  -- 16 (Adaptation) Mastery of Realms Rune 52411
  -- 32 (Corruption) Mastery of Power Rune 52412
  local client_globals = eq.get_qglobals(client);
  local trial_bit_list = {{1,52407},{2,52408},{4,52409},{8,52410},{16,52411},{32,52412}};
  local mpg_raid_trials; 
  local has_all_trials;

  if (client.valid) then
    mpg_raid_trials = tonumber(client_globals['mpg_raid_trials']);
    if ( mpg_raid_trials == nil ) then mpg_raid_trials = 0; end

    eq.debug('mpg_raid_trials: ' .. mpg_raid_trials .. ' lockout_bit_in: .. ' .. lockout_bit_in);
    if (bit.band(mpg_raid_trials, lockout_bit_in) ~= 0) then
    else
      mpg_raid_trials = bit.bor(mpg_raid_trials, lockout_bit_in);
      eq.target_global("mpg_raid_trials", tostring(mpg_raid_trials), "F", 0, client:CharacterID(), 0);

-- Creamo/Mackal say this is no longer needed - only the full pie.
--       for bk,bv in pairs(trial_bit_list) do
--         if (lockout_bit_in == bv[1]) then
--           client:SummonItem(bv[2]);
--         end
--       end
    end

    if (client:HasItem(52413) == false or (client_globals['oow_mpg_raids_complete'] == nil)) then
      has_all_trials = true;
      for bk,bv in pairs(trial_bit_list) do
        if (bit.band(mpg_raid_trials,bv[1]) ~= 0) then
        else
          has_all_trials = false;
        end
      end
      if (has_all_trials) then
        eq.target_global("oow_mpg_raids_complete", "1", "F", 0, client:CharacterID(), 0);
        -- Summon: Seal: Mastery of All
		client:SummonItem(52413); -- Item: Seal: Mastery of All
		client:Message(14,"You have demonstrated adeptness at all aspects of power that Mata Muram holds dear. As you receive the final medal, the six wedges you have collected fuse, point to point, creating a hexagonal seal.  You now hold the key to Anguish, the Fallen Palace");        
      end
    end
  end
end

function mpg_helper.Display_Completed_Trials(client)
  mpg_helper.Display_Group_Trials_Completed(client);
  mpg_helper.Display_Raid_Trials_Completed(client);
end

function mpg_helper.Display_Group_Trials_Completed(client)
  -- Get the bits of the MPG Trials completed; we should only award an AA the first time 
  -- a Character complets a trial.
  local client_globals = eq.get_qglobals(client);
  local mpg_group_trials = tonumber(client_globals["mpg_group_trials"]);
  if ( mpg_group_trials == nil ) then mpg_group_trials = 0; end

  local trial_bit_list = {1,2,4,8,16,32};
  local trial_bit_table = {
    {1, "The Mastery of Fear (Group)"},
    {2, "The Mastery of Ingenuity (Group)"},
    {4, "The Mastery of Weaponry (Group)"},
    {8, "The Mastery of Subversion (Group)"},
    {16,"The Mastery of Efficiency (Group)"},
    {32,"The Mastery of Destruction (Group)"}};

  for bitkey,bitval in pairs(trial_bit_table) do
    if (bit.band(mpg_group_trials,bitval[1]) ~= 0 ) then
      client:Message(15, "You have completed: " .. bitval[2]);
    end
  end
end

function mpg_helper.Display_Raid_Trials_Completed(client)
  -- Get the bits of the MPG Trials completed; we should only award an AA the first time 
  -- a Character complets a trial.
  -- 1  MPG_hate           - The Mastery of Hate (Raid)
  -- 2  MPG_endurance      - The Mastery of Endurance (Raid)
  -- 4  MPG_foresight      - The Mastery of Foresight (Raid)
  -- 8  MPG_specialization - The Mastery of Specialization (Raid)
  -- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
  -- 32 MPG_corruption     - The Mastery of Corruption (Raid)
  local client_globals = eq.get_qglobals(client);
  local mpg_group_trials = tonumber(client_globals["mpg_raid_trials"]);
  if ( mpg_group_trials == nil ) then mpg_group_trials = 0; end

  local trial_bit_list = {1,2,4,8,16,32};
  local trial_bit_table = {
    {1, "The Mastery of Hate (Raid)"},
    {2, "The Mastery of Endurance (Raid)"},
    {4, "The Mastery of Foresight (Raid)"},
    {8, "The Mastery of Specialization (Raid)"},
    {16,"The Mastery of Adaptation (Raid)"},
    {32,"The Mastery of Corruption (Raid)"}};

  for bitkey,bitval in pairs(trial_bit_table) do
    if (bit.band(mpg_group_trials,bitval[1]) ~= 0 ) then
      client:Message(15, "You have completed: " .. bitval[2]);
    end
  end
end
return mpg_helper;
