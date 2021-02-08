-- The Mastery of Adaptation (Raid) 
-- 
-- MPG Raid Trial General Notes
-- 1  MPG_hate           - The Mastery of Hate (Raid)
-- 2  MPG_endurance      - The Mastery of Endurance (Raid)
-- 4  MPG_foresight      - The Mastery of Foresight (Raid)
-- 8  MPG_specialization - The Mastery of Specialization (Raid)
-- 16 MPG_adaptation     - The Mastery of Adaptation (Raid)
-- 32 MPG_corruption     - The Mastery of Corruption (Raid)  
--
-- Event:
-- The Mastery of Adaptation (Raid) 
-- Master of Adaptation spawns in center of the middle platform, despawns when saying "we are ready to begin"
--
-- Construct of Power
-- -5 diminutive constructs
--
-- Construct of Ice
-- -1 mote of frost
--
-- Construct of Fire
-- -1 lick of flame
--
-- Construct of Brutality
--
-- Construct of Pain 
--
-- Shape shifted every 90-110 seconds. Seems to choose a new form at random. Strips buffs when changing forms <Balance of the Nameless>
--
-- Total HP: 3,900,000 
--
-- 890-4215 min / max quad (throughout all forms) @ 35 shielding sk
--
-- 3 loots, 2 runes, anguish seal popped onto cursor upon completion
--
-- Zone out is skull statue in port up room
-- Mobs
-- 308010 Master_of_Adaptation
-- 308014 Construct_of_Brutality
-- 308013 Construct_of_Fire
-- 308008 Construct_of_Ice
-- 308000 Construct_of_Pain
-- 308009 Construct_of_Power
--

-- piercing (36)
-- 1h blunt (0)
-- 1h slashing (1)
-- 2h blunt (2)
-- 2h slashing (3)
-- archery (7)
-- throwing (51)
-- hand to hand (28)
-- 2hp (77)
--
-- RESIST_NONE = 0,
-- RESIST_MAGIC = 1,
-- RESIST_FIRE = 2,
-- RESIST_COLD = 3,
-- RESIST_POISON = 4,
-- RESIST_DISEASE = 5,
-- RESIST_CHROMATIC = 6,
-- RESIST_PRISMATIC = 7,
-- RESIST_PHYSICAL = 8,  // see Muscle Shock, Back Swing
-- RESIST_CORRUPTION = 9
--local ThreadManager = require("thread_manager");

local event_started = false;
local instance_id;
local lockout_win = 108;
local this_bit = 16;
local player_list;
local list_constructs = {};
local last_mob;
local spells_on_change = {};
local self;
local cast_buffs = {};
local cast_spells = {};

function setup()
  -- ID, Name, Race, Gender, Texture, sub-npcs, special abilities (only sets parm0 at this time), weakness to weapons, buffs to cast
  local strong = -50;
  local weak = 50;
  local normal = 0;
  local resists_brut = {{'mr','350'},{'fr','275'},{'cr','275'},{'pr','125'},{'dr','125'}};
  local resists_fire = {{'mr','35'},{'fr','350'},{'cr','60'},{'pr','250'},{'dr','250'}};
  local resists_ice  = {{'mr','35'},{'fr','60'},{'cr','350'},{'pr','250'},{'dr','250'}};
  local resists_pain = {{'mr','35'},{'fr','275'},{'cr','275'},{'pr','250'},{'dr','250'}};
  local resists_power= {{'mr','175'},{'fr','275'},{'cr','275'},{'pr','250'},{'dr','250'}};
  
  list_constructs = {
    [1] = { '308014',
            'Construct of Brutality', 
            409,  -- Race
            2,    -- Gender
            1,    -- Texture
            {},   -- Sub-npcs
            {{SpecialAbility.rampage,50},{SpecialAbility.area_rampage,50}}, 
            {{36,weak},{0,normal},{1,normal},{2,normal},{3,normal},{7,30},{51,normal},{28,normal},{77,weak}}, 
            resists_brut },
    [2] = { '308013', 
            'Construct of Fire', 
            408, 
            2, 
            1, 
            {308003}, 
            {}, 
            {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal},{77,normal}}, 
            resists_fire, 
            {5706},
            {5705}},
    [3] = { '308008', 
            'Construct of Ice', 
            417, 
            2, 
            1, 
            {308002}, 
            {}, 
            {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal},{77,normal}}, 
            resists_ice, 
            {5707},
            {5704}},
    [4] = { '308000', 
            'Construct of Pain', 
            413, 
            2, 
            1, 
            {}, 
            {{SpecialAbility.flurry,20}}, 
            {{36,normal},{0,normal},{1,normal},{2,normal},{3,normal},{7,normal},{51,normal},{28,normal},{77,normal}}, 
            resists_pain,
            {5692},
            {5699}},
    [5] = { '308009', 
            'Construct of Power', 
            405, 
            2, 
            1, 
            {308001, 308001, 308001, 308001, 308001}, 
            {{SpecialAbility.flurry,50}}, 
            {{36,-85},{0,30},{1,-93},{2,30},{3,-93},{7,-50},{51,-50},{28,-50},{77,-85}}, 
            resists_power } 
  };

  last_mob = {};
end

function ShapeShift(e)
  -- Clean Up Last Mob
  if ( last_mob ~= nil ) then
    -- Depop Sub-NPCs
    if ( last_mob[6] ~= nil ) then
      for _,v in pairs(last_mob[6]) do
        eq.depop_all(tonumber(v));
      end
    end
    -- Unset Special Abilities
    if ( last_mob[7] ~= nil ) then
      for _,v in pairs(last_mob[7]) do
        if ( v[1] ~= nil ) then
          e.self:SetSpecialAbility(v[1], 0);
        end
      end
    end
  end

  local num = math.random(1,table.getn(list_constructs));
  local mob = list_constructs[num];

  -- Lets prevent the mob from shapeshifting to its same form; recursively
  if (mob[1] == last_mob[1]) then
    ShapeShift(e);
    return;
  end

  --mob = list_constructs[4];

  e.self:SendIllusionPacket({race=mob[3],gender=mob[4],texture=mob[5]});
  e.self:TempName(mob[2]);
  e.self:SetNPCFactionID(79); -- Faction: Gargoyle

  -- Cast Balance of the Nameless on self to remove debuffs
  e.self:CastSpell(3230, e.self:GetID()); -- Spell: Balance of the Nameless

  -- Spawn Sub-NPCs 
  if ( mob[6] ~= nil ) then 
    local x = -2;
    for _,v in pairs(mob[6]) do
      eq.spawn2( v, 0, 0, e.self:GetX() + (x*5), e.self:GetY() + (x*5) + 10, e.self:GetZ(), e.self:GetHeading() );
      x = x + 1;
    end
  end

  -- Set Special Abilities
  if ( mob[7] ~= nil ) then
    for _,v in pairs(mob[7]) do
      if ( v[1] ~= nil ) then
        e.self:SetSpecialAbility(v[1], 1);
        if ( v[2] ~= nil ) then
          e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, v[2]);
          e.self:SetSpecialAbilityParam(SpecialAbility.area_rampage, 2, 25);
        end
      end
    end
  end

  -- Set the Shapes weakness to weaponry
  if ( mob[8] ~= nil ) then
    for _,v in pairs(mob[8]) do
      if (v ~= nil and v[1] ~= nil and v[2] ~= nil) then
        e.self:ModSkillDmgTaken(v[1], v[2]); 
      end
    end
  end

  -- Set the Shapes resists
  if ( mob[9] ~= nil ) then
    for _,v in pairs(mob[9]) do
      if (v ~= nil and v[1] ~= nil and v[2] ~= nil) then
        e.self:ModifyNPCStat(v[1], tostring(v[2]));
      end
    end
  end

  self = e.self;
  --ThreadManager:Clear();

  -- Spells if present to add to the AI
  if ( mob[10] ~= nil ) then
    -- eq.set_timer('castspells', 1000);
    cast_spells = mob[10];
    CastSpells();
    --ThreadManager:Create("CastSpells", CastSpells);
  end

  -- Spells to cast once (self buffs)
  if ( mob[11] ~= nil ) then
    -- eq.set_timer('castbuffs', 500);
    cast_buffs = mob[11];
    CastBuffs();
    --ThreadManager:Create("CastBuffs", CastBuffs);
  end
  last_mob = mob;
end

function CastBuffs()
  if (cast_buffs ~= nil) then
    for _,v in pairs(cast_buffs) do
      --self:CastSpell(v, self:GetID());  
      --ThreadManager:Wait(1.0);
      self:CastedSpellFinished(v, self);
      eq.debug('Casting: ' .. v .. ' on ' .. self:GetID() );
    end
    cast_buffs = {};
  end
end

function CastSpells()
  if (cast_spells ~= nil) then
   for _,v in pairs(cast_spells) do
     --self:CastSpell(v, self:GetTarget():GetID());
     --ThreadManager:Wait(2.5);
     self:CastedSpellFinished(v, self:GetTarget());
   end
  end
end

function Boss_Spawn(e)
  event_started = false;
  instance_id = eq.get_zone_instance_id();
  player_list = eq.get_characters_in_instance(instance_id);
  lockout_win = 108;
  this_bit = 16;
  setup();
end

function Lick_Spawn(e)
  e.self:CastSpell(5705, e.self:GetID())
end

function Mote_Spawn(e)
 e.self:CastSpell(5704, e.self:GetID())
end

function Boss_Say(e)
  
  if ( event_started ~= true ) then
    if ( e.message:findi("hail") ) then
      e.self:Say("This is the Mastery of Adaptation trial. You must demonstrate your ability to adapt to an unpredictable and ever-changing opponent. Are you ready to [ " .. eq.say_link('begin', false, 'begin') .. " ]?");
    elseif ( e.message:findi("begin") ) then
      local dz = eq.get_expedition()
      if dz.valid then
        dz:SetLocked(true, ExpeditionLockMessage.Begin, 14) -- live uses "Event Messages" type 365 (not in emu clients)
        dz:AddReplayLockout(eq.seconds("3h"))
      end

      local shifttime = math.random(90, 150);
      e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0)
      e.self:SetSpecialAbility(SpecialAbility.immune_magic, 0)
      e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
      e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
      eq.spawn2(308012,0,0,0,0,0,0); -- NPC: #death_touch
      event_started = true;
      eq.set_timer('shapeshift', shifttime * 1000);
      eq.debug( "starting shift time: " .. shifttime .. " seconds");
      ShapeShift(e);

      e.self:Say("Very well!  Let the battle commence!");
    end
  end
end

function Boss_Timer(e)
  if (e.timer == "shapeshift") then
    ShapeShift(e);
	  local new_time;
	  local boss_hp = math.floor(100*e.self:GetHP()/e.self:GetMaxHP());
	  if (boss_hp <= 10 ) then 
      new_time = math.random(25, 35);
	  elseif (boss_hp <= 20) then
      new_time = math.random(35, 45);	 
	  elseif (boss_hp <= 30) then
      new_time = math.random(45, 55);
	  elseif (boss_hp <= 40) then
      new_time = math.random(55, 65);
	  elseif (boss_hp <= 50) then
      new_time = math.random(65, 75);	
	  elseif (boss_hp <= 60) then
      new_time = math.random(70, 90);
	  elseif (boss_hp <= 70) then
      new_time = math.random(75, 105);	
	  elseif (boss_hp <= 80) then
      new_time = math.random(80, 120);		
	  elseif (boss_hp <= 90) then
      new_time = math.random(85, 135);
	  else
      new_time = math.random(90, 150);
	  end
	  eq.stop_timer('shapeshift');
	  eq.debug( "HP: " .. boss_hp .. "  New Timer:" .. new_time .. " seconds");
	  eq.set_timer('shapeshift', new_time * 1000);	
  elseif (e.timer == "leftcombat") then
    ResetEvent(e);
    --elseif (e.timer == "castbuffs") then
    --ThreadManager:Resume("CastBuffs");
    --elseif (e.timer == "castspells") then
    --ThreadManager:Resume("CastSpells");
  end
end

function Boss_Death(e)
  --ThreadManager:Clear();
  eq.stop_all_timers();

  -- Disable the deathtouch
  --eq.spawn_condition('chamberse', instance_id, 2, 0 );
  eq.depop_all(308012);

  -- Spawn Shell of the Master
  eq.spawn2(308015, 0, 0, -212, 270, 66, e.self:GetHeading()); -- NPC: Shell_of_the_Master_

  -- Update the Lockouts
  local dz = eq.get_expedition()
  if dz.valid then
    dz:AddReplayLockoutDuration(eq.seconds("5d")) -- 5 days + current timer (max 123 hours)
  end

  local mpg_helper = require("mpg_helper");
  mpg_helper.UpdateRaidTrialLockout(player_list, this_bit, nil);
end

function Boss_Combat(e)
  if (e.joined == false) then
    eq.set_timer('leftcombat', 30 * 1000);
  else
    eq.stop_timer('leftcombat');
  end
end

function ResetEvent(e)
  --ThreadManager:Clear();
  eq.stop_all_timers();
  eq.repop_zone();
end

function event_encounter_load(e)
  eq.register_npc_event('mpg_adaptation', Event.say,            308010, Boss_Say);
  eq.register_npc_event('mpg_adaptation', Event.combat,         308010, Boss_Combat);
  eq.register_npc_event('mpg_adaptation', Event.spawn,          308010, Boss_Spawn);
  eq.register_npc_event('mpg_adaptation', Event.spawn,          308003, Lick_Spawn);
  eq.register_npc_event('mpg_adaptation', Event.spawn,          308002, Mote_Spawn);
  eq.register_npc_event('mpg_adaptation', Event.timer,          308010, Boss_Timer);
  eq.register_npc_event('mpg_adaptation', Event.death_complete, 308010, Boss_Death);
end

function event_encounter_unload(e)
end
