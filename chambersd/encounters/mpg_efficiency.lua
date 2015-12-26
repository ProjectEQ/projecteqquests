-- MPG Trial General Notes
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
-- Group Trial Version 1 of zone
-- Raid Trial Version 2 of zone
local instance_id;
local this_bit = 16;
local this_zone = 'chambersd';
local this_wave = 0;
local lockout_win = 72;
local lockout_loss = 2;
local lockout_name = 'MPG_efficiency';
local warnings;
local minutes_remaining;
local minutes_per_wave;
local player_list;
local instance_requests;

function Efficiency_Spawn(e)
  instance_requests = require("instance_requests");
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  minutes_per_wave = 4;
  warnings = 0;
  this_wave = 0;

  eq.spawn_condition(this_zone, instance_id, 1, 0);
end

function Efficiency_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'This is the Mastery of Efficiency trial. You must demonstrate your ability to function under less than perfect conditions, battling with limited resources. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");

  elseif (e.message:findi("begin")) then
    eq.spawn_condition(this_zone, instance_id, 1, 1);

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.set_timer("test_of_efficiency", 5 * 60 * 1000);
    eq.set_timer("waves", 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  elseif (e.message:findi("end") and e.other:Admin() >= 80)then
    eq.spawn_condition(this_zone, instance_id, 1, 0);
  end
end

function Efficiency_Timer(e)
  if (e.timer == "test_of_efficiency") then
    e.self:CastSpell(5701, e.self:GetID())

  elseif (e.timer == "waves") then
    eq.stop_timer('waves');
    eq.set_timer('waves', minutes_per_wave * 60 * 1000);

    local el = eq.get_entity_list();

    -- If the wave mobs died from the previous wave
    -- continue spawning waves; otherwise fail. 307001, 307002, 307003
    if (el:IsMobSpawnedByNpcTypeID(307001) == false 
      and el:IsMobSpawnedByNpcTypeID(307002) == false 
      and el:IsMobSpawnedByNpcTypeID(307003) == false) then 

      this_wave = this_wave + 1;

      eq.spawn_condition(this_zone, instance_id, 1, 0);
      if (this_wave < 4) then
        eq.spawn_condition(this_zone, instance_id, 1, 1);
      else
        -- Spawn the Boss: Enforcer of Efficiency
        eq.spawn_condition(this_zone, instance_id, 2, 1);
        eq.stop_timer('waves');
      end
    end

  elseif (e.timer == "minutes") then 
    minutes_remaining = minutes_remaining - 1;

    -- If the minutes reach 0; then the Master of Efficiency has not died; 
    -- otherwise we would have stopped the timer.
    if (minutes_remaining == 0) then
      eq.stop_all_timers();
      eq.spawn_condition(this_zone, instance_id, 1, 0);

      eq.zone_emote(13, "You have been found unworthy.");
      eq.depop();

      for k,v in pairs(player_list) do
        eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(2)), "H2", 0, v, 0);
      end
    else 
      eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
    end
  end
end

function Efficiency_Signal(e)
  if (e.signal == 1) then
    eq.spawn_condition(this_zone, instance_id, 1, 0);
    eq.spawn_condition(this_zone, instance_id, 2, 0);
    
    eq.stop_all_timers();
    eq.spawn2(307005, 0, 0, -212, 273, 71, 20);

    local instance_requests = require("instance_requests");
    local entity_list = eq.get_entity_list();
    local client;

    for k,v in pairs(player_list) do
      client = nil;
      -- Set a 72 hour lockout on a Win
      eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
      client = entity_list:GetClientByCharID(v) 
      client_globals = eq.get_qglobals(client);
    
      -- Get the number of MPG Trials complete; There are a max of 4 AAs to award.
      local mpg_group_aas_granted = tonumber(client_globals["mpg_group_aas_granted"]);
      if ( mpg_group_aas_granted == nil ) then mpg_group_aas_granted = 0; end
      
      -- Get the bits of the MPG Trials completed; we should only award an AA the first time 
      -- a Character complets a trial.
      local mpg_group_trials = tonumber(client_globals["mpg_group_trials"]);
      if ( mpg_group_trials == nil ) then mpg_group_trials = 0; end
      
      local has_done_this_trial; 
      if (bit.band(mpg_group_trials, this_bit) == 0) then
        has_done_this_trial = false;
      else
        has_done_this_trial = true;
      end

      -- Has character maxed out the Trials of Mata Muram (4) 
      -- Has character done this trial before?
      if ( mpg_group_aas_granted >= 0 and mpg_group_aas_granted < 4 and has_done_this_trial == false ) then
        mpg_group_aas_granted = mpg_group_aas_granted + 1;
        eq.target_global("mpg_group_aas_granted", tostring(mpg_group_aas_granted), "F", 0, v, 0);
        eq.target_global("mpg_group_trials", tostring(bit.bor(mpg_group_trials, this_bit)), "F", 0, v, 0);
        client:GrantAlternateAdvancementAbility(466, mpg_group_aas_granted);

        client:Message(15, "The understanding you have gained by completing one of Mata Muram's trials has increased your maximum resistances.");
      else 
        client:Message(15, "You have again defeated the Master of Igenuity. Congratulations.");
      end
    end
  end
end

function Deathtouch_Tick(e)
  local my_id = eq.get_zone_instance_id();
  local my_list = eq.get_characters_in_instance(my_id);

  for k,v in pairs(my_list) do
    local client = eq.get_entity_list():GetClientByCharID(v);
    if (client.valid) then 
      if (client:GetX() > -64 or client:GetY() < 122 ) then
        client:Message(13, "A deep voice booms in your head, 'This breach of the rules will not be tolerated. You must face the trials. Return to the arena or be subjected to pain.'");
        if ( warnings >= 10 ) then
          client:Message(13, "A deep voice booms in your head, 'You have been warned.  You did not heed the warnings.  Now you Die!'");
          if (client:Admin() < 80) then 
            client:Kill();
          end
        else 
          warnings = warnings + 1;
        end
      end
    end

  end
end

function Enforcer_Death(e)
  eq.signal(307000, 1);
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_efficiency', Event.spawn,          307000, Efficiency_Spawn);
  eq.register_npc_event('mpg_efficiency', Event.say,            307000, Efficiency_Say);
  eq.register_npc_event('mpg_efficiency', Event.death_complete, 307000, Efficiency_Death);
  eq.register_npc_event('mpg_efficiency', Event.timer,          307000, Efficiency_Timer);

  eq.register_npc_event('mpg_efficiency', Event.tick,           308012, Deathtouch_Tick);

  eq.register_npc_event('mpg_efficiency', Event.death_complete, 307004, Enforcer_Death);

end

function event_encounter_unload(e)
end
