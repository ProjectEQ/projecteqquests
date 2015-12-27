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
local this_bit = 2;
local this_zone = 'chambersd';
local lockout_win = 72;
local lockout_loss = 2;
local lockout_name = 'MPG_ingenuity';
local warnings;
local minutes_remaining;
local player_list;
local instance_requests;

function Ingenuity_Spawn(e)
  instance_requests = require("instance_requests");
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  warnings = 0;

  eq.spawn_condition(this_zone, instance_id, 1, 0);
end

function Ingenuity_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("This is the Mastery of Ingenuity trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");

  elseif (e.message:findi("begin")) then
    eq.spawn_condition(this_zone, instance_id, 1, 1);

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  end
end

function Ingenuity_Timer(e)
  if (e.timer == "minutes") then 
    minutes_remaining = minutes_remaining - 1;

    -- If the minutes reach 0; then the Master of Ingenuity has not died; 
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

function Ingenuity_Death(e)
  eq.spawn_condition(this_zone, instance_id, 1, 0);
  eq.stop_all_timers();
  eq.spawn2(308004, 0, 0, -212, 273, 71, 20);

  local instance_requests = require("instance_requests");
  local entity_list = eq.get_entity_list();
  local client;

  for k,v in pairs(player_list) do
    client = nil;
    -- Set a 72 hour lockout on a Win
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(72)), "H72", 0, v, 0);
    client = entity_list:GetClientByCharID(v) 
    client_globals = eq.get_qglobals(client);
  
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

    -- Has character done this trial before?
    if ( has_done_this_trial == false ) then
      eq.target_global("mpg_group_trials", tostring(bit.bor(mpg_group_trials, this_bit)), "F", 0, v, 0);
      client:GrantAlternateAdvancementAbility(466, mpg_group_aas_granted);

      client:Message(15, "The understanding you have gained by completing one of Mata Muram's trials has increased your maximum resistances.");
    else 
      client:Message(15, "You have again defeated the Master of Igenuity. Congratulations.");
    end
  end
end

function Deathtouch_Tick(e)
  local my_id = eq.get_zone_instance_id();
  local my_list = eq.get_characters_in_instance(my_id);

  for k,v in pairs(my_list) do
    local client = eq.get_entity_list():GetClientByCharID(v);
    if (client.valid) then 
      if and (client:GetX() > -64 or client:GetY() < 122 ) then
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

function event_encounter_load(e)
  eq.register_npc_event('mpg_ingenuity', Event.spawn,          308007, Ingenuity_Spawn);
  eq.register_npc_event('mpg_ingenuity', Event.say,            308007, Ingenuity_Say);
  eq.register_npc_event('mpg_ingenuity', Event.death_complete, 308007, Ingenuity_Death);
  eq.register_npc_event('mpg_ingenuity', Event.timer,          308007, Ingenuity_Timer);

  eq.register_npc_event('mpg_ingenuity', Event.tick,           308012, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
