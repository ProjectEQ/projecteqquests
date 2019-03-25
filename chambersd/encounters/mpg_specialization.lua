-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Mobs
--
-- Spells Cast:
-- [Mon Aug 24 15:20:31 2015] Master of Specialization begins to cast a spell. <Imprecision> 5700
-- [Mon Aug 24 15:20:42 2015] Master of Specialization begins to cast a spell. <Searing Pain> 5723
-- [Mon Aug 24 15:21:18 2015] Master of Specialization begins to cast a spell. <Rigidity> 5701
-- [Mon Aug 24 15:21:28 2015] Master of Specialization begins to cast a spell. <Chilling Agony> 5724
-- [Mon Aug 24 15:21:58 2015] Master of Specialization begins to cast a spell. <Curse of Misfortune> 5702
-- [Mon Aug 24 15:22:08 2015] Master of Specialization begins to cast a spell. <Glimmering Aura> 5725
-- [Mon Aug 24 15:22:38 2015] Master of Specialization begins to cast a spell. <Impurity> 5703
-- [Mon Aug 24 15:22:48 2015] Master of Specialization begins to cast a spell. <Toxic Blast> 5726

-- 1 5700 <Imprecision> 
-- 2 5723 <Searing Pain> 
-- 3 5701 <Rigidity> 
-- 4 5724 <Chilling Agony> 
-- 5 5702 <Curse of Misfortune> 
-- 6 5725 <Glimmering Aura> 
-- 7 5703 <Impurity> 
-- 8 5726 <Toxic Blast> 

local event_started = 0;
local instance_id;
local lockout_name = 'MPG_specialization';
local lockout_win = 108;
local this_bit = 8;
local player_list;
local spell_list = {};
local spell_idx = 1;
local spell_timer = 25;

function setup()
  spell_list = {
    [1] = 5700,
    [2] = 5723,
    [3] = 5701,
    [4] = 5724,
    [5] = 5702,
    [6] = 5725,
    [7] = 5703,
    [8] = 5726
  }
end

function Boss_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  event_started = 0;
  lockout_name = 'MPG_specialization';
  lockout_win = 108;
  this_bit = 8;
  setup();

  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1);
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1);
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1);
end

function Boss_Say(e)
  if ( e.message:findi("hail") ) then
    e.self:Say("This is the Mastery of Specialization trial. You must demonstrate your ability to use your primary skills and fall back on your secondary skillset when necessary. Are you ready to [" .. eq.say_link("begin", false, "begin") .. "]?");
  elseif ( e.message:findi("begin") ) then
    e.self:Say("Very well!  Let the battle commence!");

    event_started = 1;

    -- Enable the Death Toucher
    eq.spawn_condition('chambersd', instance_id, 5, 1 );
    eq.spawn2(307006,0,0,0,0,0,0); -- NPC: #death_touch

    CastSpells(e);
    eq.set_timer('spell_timer', spell_timer  * 1000);

    e.self:AddToHateList(e.other, 1);

    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0);
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 0);
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0);
  end
end

function Boss_Timer(e)
  if (e.timer == 'spell_timer' ) then 
    CastSpells(e);
  end
end

function CastSpells(e)
  if (spell_idx > 8) then
    spell_idx = 1;
  end

  -- Cast the Spell
  e.self:CastSpell(spell_list[spell_idx], e.self:GetHateTop():GetID());

  -- Increment the spell casting index;
  spell_idx = spell_idx + 1;
end

function Boss_Death(e)
  eq.stop_all_timers();

  -- Disable the Death Toucher
  eq.spawn_condition('chambersd', instance_id, 5, 0 );
  eq.depop_all(307006);

  -- Spawn Shell of the Master 
  eq.spawn2(307008, 0, 0, -212, 270, 66, e.self:GetHeading());

  -- Update the Win Lockout
  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, lockout_name);
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_specialization', Event.say,            307007, Boss_Say);
  eq.register_npc_event('mpg_specialization', Event.spawn,          307007, Boss_Spawn);
  eq.register_npc_event('mpg_specialization', Event.timer,          307007, Boss_Timer);
  eq.register_npc_event('mpg_specialization', Event.death_complete, 307007, Boss_Death);

end

function event_encounter_unload(e)
end
