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
local warnings = 0;
local minutes_remaining;
local player_list;
local mobs_killed;
local mobs_to_kill;

function Destruction_Spawn(e)
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
    local dz = eq.get_expedition()
    if dz.valid then
      dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
    end

    eq.spawn_condition(this_zone, instance_id, 1, 0);
    eq.spawn_condition(this_zone, instance_id, 1, 1);

    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
  elseif (e.message:findi("test") and e.other:Admin() > 80) then
    eq.signal(309061, 1); -- NPC: Master_of_Destruction
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

      -- no lockout added on failure, the dz shuts down in 5 minutes
      local dz = eq.get_expedition()
      if dz.valid then
        dz:SetSecondsRemaining(eq.seconds("5m"))
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
  eq.spawn2(309068, 0, 0, -212, 273, 71, 40); -- NPC: Shell_of_the_Master

  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("3d"))
  end

  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, nil);
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
    eq.signal(309061, 1); -- NPC: Master_of_Destruction
  end
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

  eq.register_npc_event('mpg_destruction', Event.spawn, 309068, Chest_Spawn);

end

function event_encounter_unload(e)
end
