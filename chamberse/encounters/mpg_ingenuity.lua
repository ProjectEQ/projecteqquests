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
local lockout_win = 72;
local lockout_loss = 2;
local warnings;
local minutes_remaining;
local player_list;

function Ingenuity_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  minutes_remaining = 15;
  warnings = 0;

  eq.spawn_condition('chamberse', instance_id, 1, 0);
end

function Ingenuity_Say(e)
  if (e.message:findi("hail")) then
    e.self:Say("This is the Mastery of Ingenuity trial. You must demonstrate your ability to think on your feet, to defeat an unbeatable opponent. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");

  elseif (e.message:findi("begin")) then
    local dz = eq.get_expedition()
    if dz.valid then
      dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
    end

    eq.spawn_condition('chamberse', instance_id, 1, 1);

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.set_timer("reflective", 45 * 1000);
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
      eq.spawn_condition('chamberse', instance_id, 1, 0);

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
  elseif (e.timer == "reflective") then
    -- Spell: Reflective Sheen - 5822 
    e.self:Emote("begins to cast a spell.  <Reflective Sheen>");
    e.self:CastSpell(5822, e.self:GetID()); -- Spell: Reflective Sheen
  end
end

function Ingenuity_Death(e)
  eq.spawn_condition('chamberse', instance_id, 1, 0);
  eq.stop_all_timers();
  eq.spawn2(308004, 0, 0, -212, 273, 71, 40); -- NPC: Shell_of_the_Master

  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("3d"))
  end

  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, nil); -- update aa flag (not lockout)
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
  eq.register_npc_event('mpg_ingenuity', Event.spawn,          308007, Ingenuity_Spawn);
  eq.register_npc_event('mpg_ingenuity', Event.say,            308007, Ingenuity_Say);
  eq.register_npc_event('mpg_ingenuity', Event.death_complete, 308007, Ingenuity_Death);
  eq.register_npc_event('mpg_ingenuity', Event.timer,          308007, Ingenuity_Timer);

  eq.register_npc_event('mpg_ingenuity', Event.spawn, 308004, Chest_Spawn);
end

function event_encounter_unload(e)
end
