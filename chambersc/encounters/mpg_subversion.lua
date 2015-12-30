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
local this_bit = 8;
local this_zone = 'chambersc';
local this_version = 1;
local lockout_win = 72;
local lockout_loss = 2;
local lockout_name = 'MPG_subversion';
local warnings;
local minutes_remaining;
local player_list;
local instance_requests;

function Subversion_Spawn(e)
  instance_requests = require("instance_requests");
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  warnings = 0;

  eq.spawn_condition(this_zone, instance_id, 1, 0);
end

function Subversion_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("This is the Mastery of Subversion trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");

  elseif (e.message:findi("begin")) then
    eq.spawn_condition(this_zone, instance_id, 1, 1);

    --e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    --e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    
    -- Until EVENT_LOOT gets exported to lua for stuffs; just set a 5min timer; it might 
    -- take about 5minutes to collect 300 points; in my mind.
    eq.set_timer("fake", 5 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  end
end

function Subversion_Timer(e)
  if (e.timer == "minutes") then 
    minutes_remaining = minutes_remaining - 1;

    -- If the minutes reach 0; then the Master of Subversion has not died; 
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
  elseif (e.timer == "fake") then
    -- The fake Timer to be removed when we can catch item looting events.
    eq.signal(306000, 1);

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);

  end
end

function Guardian_Signal(e)
  if (e.signal == 1) then
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
  end
end

function Subversion_Death(e)
  eq.spawn_condition(this_zone, instance_id, 1, 0);
  eq.stop_all_timers();
  eq.spawn2(306009, 0, 0, -212, 273, 71, 20);

  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, lockout_name);

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

function event_encounter_load(e)
  eq.register_npc_event('mpg_subversion', Event.spawn,          306001, Subversion_Spawn);
  eq.register_npc_event('mpg_subversion', Event.say,            306001, Subversion_Say);
  eq.register_npc_event('mpg_subversion', Event.death_complete, 306001, Subversion_Death);
  eq.register_npc_event('mpg_subversion', Event.timer,          306001, Subversion_Timer);

  eq.register_npc_event('mpg_subversion', Event.tick,           306020, Deathtouch_Tick);

  eq.register_npc_event('mpg_subversion', Event.signal,         306000, Guardian_Signal);
end

function event_encounter_unload(e)
end
