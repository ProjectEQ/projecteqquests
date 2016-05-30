--[[
-- Start Location: North end/wing of Muramite Proving Grounds. 
-- (Note: Players can invis to 6 way and then clear less than a dozen mobs.) 
--
-- Expedition Acquisition: There is an NPC named Projection of Mind there that assigns the expedition, which then allows players to click on the obelisk behind him and zone into the private raid instance. 
--
-- Prerequisites: No prerequisites are needed, beyond being level 65 to zone into MPG, and being in a raid. (Minimum raid size required?) 
--
-- Layout and Premise: 
-- The interior of the trial is identical to all of the other raid and group MPG trial instances. An upward path leads from the small zone in chamber to a larger circular chamber. The larger chamber has 6 small platforms arranged in a half circle around a larger central platform. As in all trials, it is safe to zone in, and the trial does not begin until a keyphrase is given to an npc. 
--
-- Upon zoning into the Hate trial there are 6 Ferans arranged one per platform, and a Master of Hate standing in the center. The goal of the event is to kill all 6 of the ferans, as well as the Master of Hate. 
--
-- Event Conditions: 
-- - Each feran is "rooted" into place, does not summon, and will not turn on someone within melee range, even if the player at the top of their aggro list is not in range. 
-- - Every 15 seconds one pup will spawn from a random living feran "mother". 
-- - There are 3 different types of pups {see below}. 
-- - Regardless how many feran mothers are still alive, a feran pup will still spawn every 15 seconds. This means that each individual remaining feran will appear to spawn pups faster as ferans are killed. 
-- - Every time a pup spawns from a feran, the health of the mother feran will drop a few percent (exact number/range needed), but not below ~18% remaining. 
-- - Each feran mother has a massive amount of hitpoints. 
-- - The Master of Hate is not a combatant until all 6 ferans are killed. 
-- - If at any time there is not a single "defensive" class still alive in the trial area, the event is over. 
--
-- SD Strategy Setup 
-- One dedicated MA is assigned to target and call assist on pups as soon as possible. 
--
-- 6 taunters are assigned to each of the feran mothers, who will generate aggro at range, and taunt any pups that spawn, while alerting the MA to the spawn. 
--
-- All pets and rogues should be assigned to DPSing on the outermost feran mother in the semi-circle. (After a couple minutes elapse for the taunter to build up aggro). 
--
-- SD Stratgy Outline 
--
-- 1) Raid zones in and preps. MA, taunters, MT, RT are all assigned. 
-- 2) For the first two minutes, everyone assists the MA. (Excluding the 6 taunters, who have been and continue to build aggro) 
-- 3) Approximately 2 minutes in, all pets and rogues are assigned to the rear arc of the outermost feran mother. 
-- 4) The rest of the raid continues to assist the MA, and the rogues and pets are moved from feran mother to feran mother as each dies, resulting in a smaller and smaller arc for the raid to move around. 
-- 5) When the last feran mother is being DPS'd, the 9th Vet/DA/RT and the MT move into position. 
-- 6) MT uses riposte discipline while taunting and generating aggro, while the DA/RT sets rampage, any backup RTs plink, debuffs begin and spam healing starts. {Chain runing on MT helps, and a BDA chain may be employed on RT} 
-- 7) MT uses defensive and possibly 9th vet when riposte disc drops. 
-- 8) If and when MT dies, backup MT uses riposte disc, hits AE taunt, calls for heals and activates defensive. 
-- 9) Victory. (Hopefully). 
--
-- Mob Info 
-- Voracious Feran(Feran "mom"): hits for ~498-1310 
--
-- Feeble Direpup: 498-1310 
-- Ferocious Direpup: 252-703 
-- Pliant Direpup: 252-703 
-- Proc: 'Lash out' (All pups) 
-- Single target, Chromatic -450, 4k DD, 6 second stun, 12 sec recast 
-- All pups have very low hitpoints. 
--
-- Master of Hate: ~1k-7k+ 
-- The master of hate's DB goes up by 10 approximately every 5 seconds. 
-- He does not quad, but he can triple. He can also kick/bash for ~1k. Reportedly cycling aggro targets resets his DB bonus. He rampages for full damage and can easily one round ramp most players. 
--
-- (Resist information requested.) 
--
-- Additional Notes 
-- While the Pups are charmable, using charm for additional dps is strongly advised against as the pups will most likely kill a caster/healer before they are recharmed. (They are not mezzable) 
--
-- Due to the 15 second spawn condition, at no time should the raid stop killing pups while a feran mother remains alive. Having the entire raid focus dps on one of the moms for even a moment will likely result in falling behind in the pup spawning, followed by a loss. 
--
-- For a raid of 46 mostly level 70 characters in Time/dodh group gear, we were able to kill the Master of Hate in approximately 4 minutes. 
--
-- It is recommended that the MT circle tanks the Master of Hate on the central platform in slow backward circles, for maximum DPS. 
--
-- DPS casters can stay out of rampage range by casting from the walls of the trial area, but careful aggro management is vital to not pull him out of position. 
--
-- Casting spellshield on the MA throughout the assisting stage of the event can help mitigate the pup's procs. 
--
-- Having the MA zone in last may result in spawned pups going for the MA first, by default. 
--
-- It may seem like a good idea to stack necro dots on the feran mothers for maximum DPS, but they are very resistant, and this may not be worthwhile. 
--
-- Rogues and pets are used on ferans as their dps is greatly reduced when attempting to chase the MA targets, whereas on the feran mothers their dps can be applied continuously at maximum output. 
--
-- Rampage is major concern (on the Master of Hate), as it will tear through an unprepared raid. All possible RTs and even clerics should have DA or HS ready. 
--
-- Having a dedicated taunter to periodically snag aggro from the MT also allegedly resets the DB bonus the master has been accumulating. We haven't been able to confirm this 100%, but it may help. Recommend having a warrior not in the MT line hit taunt and fort the second it goes through, letting the MT then snap aggro back. 
--
-- Loot 
-- If the raid is successful, the "shell of the master" is found in the middle of the central platform and can be opened with /open. 
--]]
--
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  

local instance_id;
local lockout_name = 'MPG_hate';
local lockout_win = 108;
local this_bit = 1;
local player_list;
local hate_di;
local hate_max;
local orig_max;
local feran = { 304019,304023,304024,304025,304026,304027 }

local pup_spawn_seconds = 15; 
local hate_scale_seconds = 1;

function Hate_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  lockout_name = 'MPG_hate';
  lockout_win = 108;
  this_bit = 1;
  player_list = eq.get_characters_in_instance(instance_id);

  hate_max = e.self:GetMaxDMG();
  orig_max = e.self:GetMaxDMG();
  feran = { 304019,304023,304024,304025,304026,304027 }

  -- Set the Master of Hate to be Non Combat
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
  
  -- Disable the Death Toucher
  eq.spawn_condition('chambersa', instance_id, 3, 0 );
end

function Hate_Say(e)
  if ( e.message:findi("hail") ) then
    e.self:Say("This is the Mastery of Hate trial. You must incite your enemies to focus their rage on those who are best equpped to handle it. Should your force exhaust your defensive members at any point in time, you will fail. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");
  elseif ( e.message:findi("begin") ) then
    e.self:Say("Very well!  Let the battle commence!");

    -- Enable the Death Toucher
    eq.spawn_condition('chambersa', instance_id, 3, 1 );

    eq.set_timer('direpups', pup_spawn_seconds  * 1000);
  end
end

function Hate_Timer(e)
  if (e.timer == 'direpups') then
    Spawn_Direpup();
  elseif (e.timer == 'hatefight') then
    -- After analyzing logs; Max hit goes up by 40dmg per second.
    hate_max = hate_max + 40;
    e.self:ModifyNPCStat("max_hit", tostring( hate_max ) );
  end
end

function Hate_Death(e)
  eq.stop_all_timers();

  -- Disable the Death Toucher
  eq.spawn_condition('chambersa', instance_id, 3, 0 );

  -- Spawn a Greedy Dwarf to distribute loot until all MPG Raid Trials are complete
  eq.spawn2(304028, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());

  -- Update the Win Lockout
  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, lockout_name);
end

function Hate_Signal(e)
  -- Signal 1 means one of the Vorasious Feran have died
  -- If they are all dead then stop the timer and activate
  -- the Master of Hate.
  if e.signal == 1 then
    local el = eq.get_entity_list();
    if (el:IsMobSpawnedByNpcTypeID(304019) == false and
        el:IsMobSpawnedByNpcTypeID(304023) == false and
        el:IsMobSpawnedByNpcTypeID(304024) == false and
        el:IsMobSpawnedByNpcTypeID(304025) == false and
        el:IsMobSpawnedByNpcTypeID(304026) == false and
        el:IsMobSpawnedByNpcTypeID(304027) == false ) then

      eq.stop_timer('direpups');

      -- Set the Master of Hate to be Combatable
      -- 24 Will Not Aggro
      -- 25 Immune to Aggro
      -- 35 No Harm from Players
      e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
      e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
      e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);

    end
  end
end

function Hate_Combat(e)
  if e.joined == true then
    -- Reset the Max Hit to allow for raiders to reset and not have to start
    -- at a silly high Max Hit if they wipe.
    hate_max = orig_max;
    e.self:ModifyNPCStat("max_hit", tostring( hate_max ) );
    eq.set_timer('hatefight', hate_scale_seconds * 1000);

    -- Enable the Death Toucher (this should only be needed if there is a whipe and an attempted recovery).
    eq.spawn_condition('chambersa', instance_id, 3, 1 );
  else
    eq.stop_timer('hatefight');
    
    -- Disable the Death Toucher
    eq.spawn_condition('chambersa', instance_id, 3, 0 );
  end
end

function Spawn_Direpup()
  -- Every 15 seconds one pup will spawn from a random living feran "mother". 
  local npc_id = nil;
  local npc = nil;
  local index = nil;
  local max = nil;
  repeat
    max = table.getn(feran);
    index = math.random(1,max);
    npc_id = feran[index];
    npc = eq.get_entity_list():GetNPCByNPCTypeID(npc_id);
    if not npc.valid then
      npc_id = nil;
      table.remove(feran,index);
      if max == 1 then
        -- If the max was 1 before removing this item
        -- then we are removing the last item and need
        -- to abort this process; the feran mother was
        -- killed after this search was started but
        -- before we got to this spot in the code so 
        -- we can abort the loop.
        return
      end
    end
  until npc_id ~= nil

  if npc:GetHPRatio() > 18 then
    npc:SetHP( npc:GetHP() - 57000 );
  end

  -- Spawn a random pup 304015, 304016 or 304018
  local pup_id = eq.ChooseRandom( 304015, 304016, 304018 );
  eq.spawn2(pup_id, 0, 0, npc:GetX() + 10, npc:GetY() + 10, npc:GetZ(), npc:GetHeading());
end

function Feran_Death(e)
  -- If all the Ferans are dead; then stop the direpups timer and activate the Master of Hate
  eq.signal(304017, 1);
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
  eq.register_npc_event('mpg_hate', Event.spawn,          304017, Hate_Spawn);
  eq.register_npc_event('mpg_hate', Event.say,            304017, Hate_Say);
  eq.register_npc_event('mpg_hate', Event.timer,          304017, Hate_Timer);
  eq.register_npc_event('mpg_hate', Event.death_complete, 304017, Hate_Death);
  eq.register_npc_event('mpg_hate', Event.signal,         304017, Hate_Signal);
  eq.register_npc_event('mpg_hate', Event.combat,         304017, Hate_Combat);

  eq.register_npc_event('mpg_hate', Event.tick,           304021, Deathtouch_Tick);

  eq.register_npc_event('mpg_hate', Event.death_complete, 304019, Feran_Death);
  eq.register_npc_event('mpg_hate', Event.death_complete, 304023, Feran_Death);
  eq.register_npc_event('mpg_hate', Event.death_complete, 304024, Feran_Death);
  eq.register_npc_event('mpg_hate', Event.death_complete, 304025, Feran_Death);
  eq.register_npc_event('mpg_hate', Event.death_complete, 304026, Feran_Death);
  eq.register_npc_event('mpg_hate', Event.death_complete, 304027, Feran_Death);
end

function event_encounter_unload(e)
end
