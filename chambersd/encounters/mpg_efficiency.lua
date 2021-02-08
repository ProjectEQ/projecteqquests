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
local warnings;
local minutes_remaining;
local minutes_per_wave;
local player_list;

function Efficiency_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  minutes_per_wave = 4;
  warnings = 0;
  this_wave = 0;

  eq.spawn_condition(this_zone, instance_id, 1, 0);
end

function check_debuff(m)
  local clients = eq.get_entity_list():GetClientList();
  for client in clients.entries do
    if (client.valid and not client:FindBuff(5708) and m:CalculateDistance(client:GetX(), client:GetY(), client:GetZ()) <= 500) then
      m:SendBeginCast(5708, 0);
      m:SpellFinished(5708, client:CastToMob());
    end
  end
end

function Efficiency_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("'This is the Mastery of Efficiency trial. You must demonstrate your ability to function under less than perfect conditions, battling with limited resources. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");

  elseif (e.message:findi("begin")) then
    local dz = eq.get_expedition()
    if dz.valid then
      dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
    end

    this_wave = 0;

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.set_timer("test_of_efficiency", 1500); -- this event checks for the debuff on a timer, 1.5 seconds shouldn't be too bad with only a max of 6 toons

    check_debuff(e.self);

    eq.set_timer("waves", 1000);

    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  elseif ( e.message:findi('end') and e.other:Admin() > 80) then

    eq.spawn_condition(this_zone, instance_id, 1, 0);
    eq.spawn_condition(this_zone, instance_id, 2, 0);
    eq.zone_emote(14, 'Resetting spawn conditions');

  elseif ( e.message:findi("test") and e.other:Admin() > 80) then
    eq.signal( 307000, 1); -- NPC: Master_of_Efficiency
  end
end

function Efficiency_Timer(e)
  if (e.timer == "test_of_efficiency") then
    check_debuff(e.self);
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

      -- no lockout added on failure, the dz shuts down in 5 minutes
      local dz = eq.get_expedition()
      if dz.valid then
        dz:SetSecondsRemaining(eq.seconds("5m"))
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
    eq.spawn2(307005, 0, 0, -212, 273, 71, 40); -- NPC: Shell_of_the_Master
    eq.depop();

    local dz = eq.get_expedition()
    if dz.valid then
      dz:AddReplayLockout(eq.seconds("3d"))
    end

    local mpg_helper = require("mpg_helper");
    mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, nil);
  end
end

function Enforcer_Death(e)
  eq.signal(307000, 1); -- NPC: Master_of_Efficiency
end

function Chest_Spawn(e)
  local client_list = eq.get_entity_list():GetClientList();
  for v in client_list.entries do
    if (v:GetGlobal("cleric20_mpg_drop") == "1") then
      e.self:CastToNPC():AddItem(56016, 1);
      return
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_efficiency', Event.spawn,          307000, Efficiency_Spawn);
  eq.register_npc_event('mpg_efficiency', Event.say,            307000, Efficiency_Say);
  eq.register_npc_event('mpg_efficiency', Event.timer,          307000, Efficiency_Timer);
  eq.register_npc_event('mpg_efficiency', Event.signal,         307000, Efficiency_Signal);

  eq.register_npc_event('mpg_efficiency', Event.death_complete, 307004, Enforcer_Death);

  eq.register_npc_event('mpg_efficiency', Event.spawn, 307005, Chest_Spawn);
end

function event_encounter_unload(e)
end
