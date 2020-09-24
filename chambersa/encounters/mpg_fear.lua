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
local mobs_died;
local mobs_must_die;
local minutes_remaining;
local this_bit = 1;
local lockout_win = 72;
local lockout_loss = 2;
local warnings = 0;
local aa_grant_list;

function Fear_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  mobs_died = 0;
  mobs_must_die = 15;
  minutes_remaining = 15;
  player_list = eq.get_characters_in_instance(instance_id);
  this_bit = 1;

  eq.spawn_condition('chambersa', instance_id, 1, 1 );
  eq.spawn_condition('chambersa', instance_id, 2, 0 );

end

function Fear_Say(e)
  instance_id = eq.get_instance_id('chambersa', 1);
  if ( e.message:findi("hail") ) then
    e.self:Say("This is the Mastery of Fear trial.  You must demonstrate your ability to inflict terror in the hearts of your enemies, and defend yourself when this tactic fails.  Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");
  elseif ( e.message:findi("begin") ) then
    local dz = eq.get_expedition()
    if dz.valid then
      dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
    end

    eq.spawn_condition('chambersa', instance_id, 2, 1 );

    e.self:Say("Very well!  Let the battle commence!");

    eq.set_timer("minutes", 1 * 60 * 1000);
    eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");

  elseif ( e.message:findi('test') and e.other:Admin() > 80 ) then
    local mpg_helper = require("mpg_helper");
    mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, nil);
  end
end

function Fear_Signal(e)
  mobs_died = mobs_died + 1;
end

function Fear_Timer(e)
  if (e.timer == 'minutes') then
    minutes_remaining = minutes_remaining - 1;
    
    if (minutes_remaining == 0) then
      local player_list = eq.get_characters_in_instance(instance_id);
      
      eq.stop_timer('minutes');
      eq.spawn_condition('chambersa', instance_id, 1, 0 );
      eq.spawn_condition('chambersa', instance_id, 2, 0 );

      if (mobs_died >= mobs_must_die) then

        eq.spawn2(304013, 0, 0, -212, 273, 71, 40); -- NPC: Shell_of_the_Master
        eq.depop();

        local dz = eq.get_expedition()
        if dz.valid then
          dz:AddReplayLockout(eq.seconds("3d"))
        end

        local mpg_helper = require("mpg_helper");
        mpg_helper.UpdateGroupTrialLockout(player_list, this_bit, nil);

      else
        eq.zone_emote(13, "You have been found unworthy, perhapse you are not as frightful as you thought you might be.");
        eq.depop();

        -- no lockout added on failure, the dz shuts down in 5 minutes
        local dz = eq.get_expedition()
        if dz.valid then
          dz:SetSecondsRemaining(eq.seconds("5m"))
        end
      end
    else 
      eq.zone_emote(15, "You have " .. minutes_remaining .. " minutes remaining to complete your task.");
    end
  end
end

function Fearless_Died(e)
  eq.signal(304004, 1); -- NPC: Master_of_Fear
end

function Fearable_Tick(e)
  local hp = e.self:GetMaxHP() * .20;
  if (e.self:IsFeared()) then
    if ( (e.self:GetHP() - hp ) > 0 ) then 
      e.self:SetHP( e.self:GetHP() - hp );
    else
      eq.depop_with_timer();
    end
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
  eq.register_npc_event('mpg_fear', Event.tick, 304006, Fearable_Tick);
  eq.register_npc_event('mpg_fear', Event.tick, 304007, Fearable_Tick);
  eq.register_npc_event('mpg_fear', Event.tick, 304008, Fearable_Tick);
  eq.register_npc_event('mpg_fear', Event.tick, 304009, Fearable_Tick);

  eq.register_npc_event('mpg_fear', Event.death_complete, 304005, Fearless_Died);
  eq.register_npc_event('mpg_fear', Event.death_complete, 304010, Fearless_Died);
  eq.register_npc_event('mpg_fear', Event.death_complete, 304011, Fearless_Died);
  eq.register_npc_event('mpg_fear', Event.death_complete, 304012, Fearless_Died);

  eq.register_npc_event('mpg_fear', Event.spawn,          304004, Fear_Spawn);
  eq.register_npc_event('mpg_fear', Event.say,            304004, Fear_Say);
  eq.register_npc_event('mpg_fear', Event.signal,         304004, Fear_Signal);
  eq.register_npc_event('mpg_fear', Event.timer,          304004, Fear_Timer);

  eq.register_npc_event('mpg_fear', Event.spawn, 304013, Chest_Spawn);
end

function event_encounter_unload(e)
end
