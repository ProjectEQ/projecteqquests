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
local this_bit = 32;
local this_zone = 'chambersf';
local lockout_win = 72;
local lockout_loss = 2;
local lockout_name = 'MPG_destruction';
local warnings;
local minutes_remaining;
local player_list;
local instance_requests;
local mobs_killed;
local mobs_to_kill;

function Destruction_Spawn(e)
  instance_requests = require("instance_requests");
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  warnings = 0;
  mobs_killed = 0;
  mobs_to_kill = 20;

  eq.spawn_condition(this_zone, instance_id, 1, 0);

  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
end

function Destruction_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'This is the Mastery of Destruction trial. You must demonstrate your ability to annihilate your enemies, destroying as many opponents as possible within a given time frame. Are you ready to [ " .. eq.say_link('begin',false,'begin') .. " ]?'");

  elseif (e.message:findi("begin")) then
    eq.spawn_condition(this_zone, instance_id, 1, 0);
    eq.spawn_condition(this_zone, instance_id, 1, 1);

    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  elseif (e.message:findi("test") and e.other:Admin() > 80) then
    eq.signal(309061, 1);
  end
end

function Destruction_Timer(e)
  if (e.timer == "minutes") then 
    minutes_remaining = minutes_remaining - 1;

    -- If the minutes reach 0; then the Master of Destruction has not died; 
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
  elseif ( e.timer == 'destruction' ) then
    -- Every 6 seconds the Master of Destruction is alive; make him harder
    e.self:ModifyNPCStat("max_hit", tostring( e.self:GetMaxDMG() + 500 ) );
  end
end

function Destruction_Death(e)
  eq.spawn_condition(this_zone, instance_id, 1, 0);
  eq.stop_all_timers();
  eq.spawn2(309068, 0, 0, -212, 273, 71, 20);

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

function Destruction_Signal(e)
  if (e.signal == 1) then
    eq.spawn_condition(this_zone, instance_id, 1, 0);

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);

    eq.set_timer('destruction', 6 * 1000);

  end
end

function Mini_Death(e)
  mobs_killed = mobs_killed + 1;

  if ( mobs_killed >= mobs_to_kill ) then
    eq.signal(309061, 1);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_destruction', Event.spawn,          309061, Destruction_Spawn);
  eq.register_npc_event('mpg_destruction', Event.say,            309061, Destruction_Say);
  eq.register_npc_event('mpg_destruction', Event.death_complete, 309061, Destruction_Death);
  eq.register_npc_event('mpg_destruction', Event.timer,          309061, Destruction_Timer);
  eq.register_npc_event('mpg_destruction', Event.signal,         309061, Destruction_Signal);

  eq.register_npc_event('mpg_destruction', Event.death_complete, 309067, Mini_Death);
  eq.register_npc_event('mpg_destruction', Event.death_complete, 309064, Mini_Death);
  eq.register_npc_event('mpg_destruction', Event.death_complete, 309062, Mini_Death);
  eq.register_npc_event('mpg_destruction', Event.death_complete, 309066, Mini_Death);
  eq.register_npc_event('mpg_destruction', Event.death_complete, 309063, Mini_Death);
  eq.register_npc_event('mpg_destruction', Event.death_complete, 309065, Mini_Death);

  eq.register_npc_event('mpg_destruction', Event.tick,           309069, Deathtouch_Tick);
end

function event_encounter_unload(e)
end
